package StepDefinitions;

import com.google.gson.Gson;
import dto.PaymentResponseDto;
import dto.PerceptionDto;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.Assert;
import utils.Utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;


public class DigitalServices {
    private static final String uri = "https://digital-services-dev.paygoal.io/v1/perceptions";
    private static final Utils utils = new Utils();
    private static PaymentResponseDto paymentResponseDto;
    private static Response response;

    @Given("un payment en dia {string} con taxpayerid {long} en jusrisdiccion {long} con monto en {string} con importe {float} y merchant {string}")
    public void generate_payment(String date, long taxpayerId, long jurisdiction, String currency, float amount, String merchant) {
        String jsonRequest = utils.generateRequestJson(date, taxpayerId, jurisdiction, currency, amount, merchant);
        RestAssured.baseURI = uri;
        RequestSpecification request = RestAssured.given();
        request.header("Content-Type", "application/json");
        request.body(jsonRequest);
        response = request.post();
    }

    @When("obtengo calculo con status {int}")
    public void response_perception(int statusCode) {
        Assert.assertEquals(response.getStatusCode(), statusCode);
        String jsonResponse = response.getBody().asPrettyString();
        Gson gson = new Gson();
        paymentResponseDto = gson.fromJson(jsonResponse, PaymentResponseDto.class);
    }

    @Then("la percepcion de {long} debe ser {float}, la condicion debe ser {string}, la base imponible debe ser {float}, el regimen debe ser {long} y la alicuota {float}")
    public void validate_taxes(long taxCode, float perception, String condition, float taxBase, Long regime, float rate) {
        PerceptionDto perceptionDto = paymentResponseDto.getPerceptions()
                .stream()
                .filter(p -> Objects.equals(p.getTaxCode(), taxCode))
                .findFirst()
                .orElse(null);

        if (isNullGherkin(perception, condition, taxBase, regime, rate)) {
            Assert.assertNull(perceptionDto);
        } else {
            Assert.assertEquals(regime, perceptionDto.getTaxRegimeCode());
            Assert.assertEquals(condition, perceptionDto.getType());
            Assert.assertEquals(new BigDecimal(taxBase).setScale(2, RoundingMode.HALF_UP), perceptionDto.getTaxBase());
            Assert.assertEquals(new BigDecimal(rate).setScale(4, RoundingMode.HALF_UP), perceptionDto.getRate());
            Assert.assertEquals(new BigDecimal(perception).setScale(2, RoundingMode.HALF_UP), perceptionDto.getAmount());
        }
    }


    private boolean isNullGherkin(float perception, String condition, float taxBase, long regime, float rate) {
        return perception == 0 && Objects.equals(condition, "-") && taxBase == 0 && regime == 0 && rate == 0;
    }

}