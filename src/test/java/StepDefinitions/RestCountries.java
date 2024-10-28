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

public class RestCountries {
    private static final String uri = "https://restcountries.com/v3.1/translation/";
    private static final String fields = "?fields=capital,flags,tld,population";
    private static final CountryDto countryDto = new CountryDto();
    private static Response response;

    @Given("el país {string}")
    public void fetchDatosDelPaisDesdeLaApi(String country) {
        RestAssured.baseURI = uri;
        RequestSpecification request = RestAssured.given();
        response = request.get(country + fields);
        System.out.println(response.getBody().asString());
    }

    @When("obtengo los datos del país")
    public void mapearDatosDelPais() {
        List<String> capital = response.jsonPath().getList("[0].capital");
        String flagDescription = response.jsonPath().get("[0].flags.alt");
        countryDto.setCapital(capital.get(0));
        countryDto.setFlagDescription(flagDescription);
        System.out.println(countryDto);
    }

    @Then("la capital debe ser {string}")
    public void verificarCapital(String capital) {
        Assert.assertEquals(capital, countryDto.getCapital());
    }

    @Then("la bandera debe tener los colores {string}")
    public void verificarBandera(String colores) {
        String[] coloresList = colores.toLowerCase().split(",\\s*");
        for (String color : coloresList) {
            Assert.assertTrue("El color \"" + color + "\" no se encuentra en la descripción de la bandera.",
                    countryDto.getFlagDescription().contains(color.toLowerCase()));
        }
    }

    //agregar métodos de verificación acá
}
