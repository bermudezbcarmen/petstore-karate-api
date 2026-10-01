package runners;

import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

class PetStoreTest {

    @Test
    void petLifecycleShouldWork() {
        SuiteResult result = Runner.path("classpath:petstore/e2e/pet-lifecycle.feature")
                .outputHtmlReport(true)
                .parallel(1);

        assertTrue(result.getScenarioCount() > 0, "No se ejecutaron escenarios de PetStore");
        assertTrue(result.isPassed(),
                () -> String.join(System.lineSeparator(), result.getErrors()));
    }
}
