package org.example.runner;

import org.junit.runner.RunWith;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = { "pretty" },
        features = "src/test/resources/features/Users.feature",
        glue = {"org.example.definitions" }
)

public class UsersApiTestRunner {}