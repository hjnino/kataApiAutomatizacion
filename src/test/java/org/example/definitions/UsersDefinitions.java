package org.example.definitions;

import io.cucumber.java.After;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;

import static org.hamcrest.Matchers.anyOf;
import static org.hamcrest.Matchers.equalTo;


public class UsersDefinitions {
    private static final String URL = "https://fakestoreapi.com";
    public Response response;

    @Given("El usuario tiene URL del API de usuarios")
    public void getUrl() {
        RestAssured.baseURI = URL;
    }


    /* GET  */
    @When("Consulta la url  GET {string}")
    public void sendRequestGetUsers(String endpoint)  {
        response = RestAssured.given()
                .contentType("application/json")
                .header("Content-Type", "application/json")
                .when()
                .get(RestAssured.baseURI + endpoint);
    }

    @Then("El codigo de estado retorna un codigo {int} OK")
    public void verifyResponse(int status) {
        response.then().statusCode(status);
    }

    @And("Debe contener una arreglo de usuario con {int}")
    public void verifyResponseContent(int id) {
        response.then().body("[0].id", equalTo(id));
    }

    @And("Debe contener una objeto de un usuario con {int} con email {string}")
    public void verifyResponseUserContent(int id, String value) {
        response.then().body("id", equalTo(id));
        response.then().body("email", equalTo(value));
    }


    /* POST */
    @When("El usuario desea crear un nuevo usuario con los datos {string} {string} y {string} y el metodo POST")
    public void sendPostRequest(String username, String email, String password) {
        System.out.println(username +  " " +  email +  " " + password);

        String stringPost = """
            {
                "username": "%s",
                "email": "%s",
                "password": "%s"
            }
            """.formatted(username, email, password);
        response = RestAssured.given()
                .contentType("application/json")
                .body(stringPost)
                .post(RestAssured.baseURI + "/users");
    }

    @And("Debe contener una objeto de un usuario con {int} o {int}")
    public void debeContenerUnaObjetoDeUnUsuarioConO(int id, int id2) {
        response.then().body("id", anyOf(equalTo(id), equalTo(id2)));
    }

    /* Fin de cada  escenario */
    @After
    public void tearDown() {
        System.out.println("Prueba finalizada. Código de estado: " + response.getStatusCode());
        System.out.println("Cuerpo de la respuesta: " + response.getBody().asString());
    }
}