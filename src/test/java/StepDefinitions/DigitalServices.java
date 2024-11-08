package StepDefinitions;

import com.google.gson.Gson;
import dto.PaymentRequestDto;
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
import java.util.NoSuchElementException;
import java.util.stream.Collectors;


public class DigitalServices {
    private static final String uri = "https://ssdd-dev.paygoal.io/";
    private static final String path = "v1/perception";
    private static final Utils utils = new Utils();
    private static PaymentResponseDto paymentResponseDto;
    private static Response response;

    @Given("un payment con importe en dia {int} con taxpayerid {string} en jusrisdiccion {long} con monto en {string} con importe {float} y merchant {string}")
    public void generate_payment(int date, String taxpayerId, long jurisdiction, String currency, float amount, String merchant) {
        String jsonRequest = utils.generateRequestJson(date, taxpayerId, jurisdiction, currency, amount, merchant);
//        RestAssured.baseURI = uri;
//        RequestSpecification request = RestAssured.given();
//        request.header("Content-Type", "application/json");
//        request.body(jsonRequest);
//        response = request.post();
    }

    @When("obtengo calculo con status {int}")
    public void response_perception(int statusCode) {
//        Assert.assertEquals(response.getStatusCode(), statusCode);
//        response.body().prettyPrint();
//        Gson gson = new Gson();
//        paymentResponseDto = gson.fromJson(response.body().prettyPrint(), PaymentResponseDto.class);
    }

    @Then("la percepcion de {string} debe ser {float}, la condicion debe ser {string}, la base imponible debe ser {float}, el regimen debe ser {string} y la alicuota {float}")
    public void validate_taxes(String tax, float perception, String condition, float taxBase, String regime, float rate) {
        String mockResponse = utils.getContentFromFile("src/test/resources/mock_response.json");
        Gson gson = new Gson();
        paymentResponseDto = gson.fromJson(mockResponse, PaymentResponseDto.class);
        PerceptionDto perceptionDto = paymentResponseDto.getPerceptions().stream()
                .filter(p -> p.getId().equals(tax))
                .findFirst()
                .get();

        Assert.assertEquals(new BigDecimal(perception).setScale(2, RoundingMode.HALF_UP), perceptionDto.getAmount());
        Assert.assertEquals(condition, perceptionDto.getType());
        Assert.assertEquals(new BigDecimal(taxBase).setScale(2, RoundingMode.HALF_UP), perceptionDto.getTaxBase());
        Assert.assertEquals(regime, perceptionDto.getTaxRegimeCode());
        Assert.assertEquals(new BigDecimal(rate).setScale(2, RoundingMode.HALF_UP), perceptionDto.getRate());


    }

}
