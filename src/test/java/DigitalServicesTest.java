import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources/digital_services.feature",
        glue = "StepDefinitions",
        publish = true)
public class DigitalServicesTest {
}

