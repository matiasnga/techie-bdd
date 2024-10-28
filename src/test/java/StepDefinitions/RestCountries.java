package StepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import Dto.CountryDto;
import org.junit.Assert;

import java.util.List;
import java.util.regex.Pattern;

public class RestCountries {
    private static final String uri = "https://restcountries.com/v3.1/name/";
    private static final String fields = "?fields=capital,flags,tld,population";
    private static final CountryDto countryDto = new CountryDto();
    private static Response response;

    @Given("el país {string}")
    public void fetchDatosDelPaisDesdeLaApi(String country) {
        RestAssured.baseURI = uri;
        RequestSpecification request = RestAssured.given();
        response = request.get(country + fields);
    }

    @When("obtengo los datos del país")
    public void mapearDatosDelPais() {
        List<String> capital = response.jsonPath().getList("[0].capital");
        String flagDescription = response.jsonPath().get("[0].flags.alt");
        countryDto.setCapital(capital.get(0));
        countryDto.setFlagDescription(flagDescription);
    }

    @Then("la capital debe ser {string}")
    public void verificarCapital(String capital) {
        Assert.assertEquals(capital, countryDto.getCapital());
    }

    @Then("la bandera debe tener los colores {string}")
    public void verificarBandera(String colores) {
        String[] coloresList = colores.toLowerCase().split(",\\s*");
        for (String color : coloresList) {
            String regex = "\\b" + color + "\\b"; // \\b es un delimitador de palabra
            Assert.assertTrue("El color \"" + color + "\" no se encuentra en la descripción de la bandera.",
                    Pattern.compile(regex).matcher(countryDto.getFlagDescription()).find());
        }
    }

    //agregar métodos de verificación acá
}
