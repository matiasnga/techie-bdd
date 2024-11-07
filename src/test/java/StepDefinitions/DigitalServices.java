package StepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import utils.Utils;


public class DigitalServices {
    private static final String uri = "https://ssdd-dev.paygoal.io/";
    private static final String path = "v1/perception";
    private static final Utils utils = new Utils();

    @Given("un payment con importe en dia {int} con taxpayerid {string} en jusrisdiccion {long} con monto en {string} con importe {float} y merchant {string}")
    public void generate_payment(int date, String taxpayerId, long jurisdiction, String currency, float amount, String merchant) {
        String jsonRequest = utils.generateRequestJson(date, taxpayerId, jurisdiction, currency, amount, merchant);
        System.out.println(jsonRequest);

    }

    @When("obtengo calculo con status {int}")
    public void response_perception(int statusCode) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Then("la percepcion de {int} debe ser {float}, la condicion debe ser {string}, la base imponible debe ser {float}, el regimen debe ser {int} y la alicuota {float}")
    public void validate_taxes(int tax, float perception, String condition, float taxBase, int regime, float rate) {
        throw new UnsupportedOperationException("Not supported yet.");

    }

}
