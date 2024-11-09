import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.AfterClass;
import org.junit.runner.RunWith;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources/digital_services.feature",
        glue = "StepDefinitions",
        publish = true,
        plugin = {"json:target/cucumber-report.json"}
)
public class DigitalServicesTest {
    @AfterClass
    public static void generateReport() {
        File reportOutputDirectory = new File("src/test/resources/");
        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add("target/cucumber-report.json");
        Configuration configuration = new Configuration(reportOutputDirectory, "Servicios Digitales");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        reportBuilder.generateReports();
    }
}

