package starter.stepdefinitions;

import com.beust.ah.A;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import net.serenitybdd.rest.SerenityRest;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.rest.abilities.CallAnApi;
import net.serenitybdd.screenplay.rest.interactions.Delete;
import net.serenitybdd.screenplay.rest.interactions.Get;
import net.serenitybdd.screenplay.rest.interactions.Post;
import net.serenitybdd.screenplay.rest.interactions.Put;
import org.apache.http.entity.ContentType;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import com.github.javafaker.Faker;
import starter.data.User;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;

public class APIStepDef {

    String baseURL = "http://54.255.178.155";

    String timestamp = Instant.now().toString(); // Generate current timestamp in UTC

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String formattedTimestamp = Instant.parse(timestamp).atZone(ZoneOffset.UTC).format(formatter);

    User user = new User();

    @Given("{actor} call an api {string} with method {string} with payload below")
    public void callApi(Actor actor, String path, String method, DataTable table) {
        actor.whoCan(CallAnApi.at(baseURL));

        // Create request body json instance
        JSONObject bodyRequest = new JSONObject();


        // Get headers
        List<List<String>> rowsList = table.asLists(String.class);
        List<String> headerList = rowsList.get(0);

        // Get values
        List<Map<String, String>> rowsMap = table.asMaps(String.class, String.class);
        Map<String, String> valueList = rowsMap.get(0);

        // Loop on every values and set value with key from header to request body
        for (int i = 0; i < valueList.size(); i++) {
            Faker faker = new Faker(new Locale("in-ID"));

            String key = headerList.get(i);

            // check if value correspond to random syntax
            switch (valueList.get(key)) {
                case "randomEmail" -> {
                    String randomEmail = faker.internet().emailAddress();
                    bodyRequest.put(key, randomEmail);
                    user.setEmail(randomEmail);
                }
                case "randomPassword" -> {
                    String randomPassword = faker.internet().password();
                    bodyRequest.put(key, randomPassword);
                    user.setPassword(randomPassword);
                }
                case "randomFullname" -> {
                    String randomFullname = faker.name().fullName();
                    bodyRequest.put(key, randomFullname);
                    user.setFullName(randomFullname);
                }
                case "randomProductName" -> bodyRequest.put(key, faker.commerce().productName());
                case "randomProductDescription" -> bodyRequest.put(key, faker.lorem().sentence());
                case "randomProductStock" -> bodyRequest.put(key, faker.random().nextInt(1, 100).toString());
                case "randomPrice" -> bodyRequest.put(key, faker.commerce().price());
                case "userEmail" -> bodyRequest.put(key, user.getEmail());
                case "userPassword" -> bodyRequest.put(key, user.getPassword());
                case "randomName" -> bodyRequest.put(key, faker.name().fullName());
                case "randomPhone" -> bodyRequest.put(key, faker.phoneNumber().subscriberNumber(12));
                case "randomCity" -> bodyRequest.put(key, faker.address().cityName());
                case "randomProvince" -> bodyRequest.put(key, faker.address().state());
                case "randomAddress" -> bodyRequest.put(key, faker.address().fullAddress());
                case "retypepass" -> bodyRequest.put(key, user.getPassword());
                case "randomArrive" -> bodyRequest.put("arrived_at", formattedTimestamp);
                case "balance"-> bodyRequest.put(key, 1000000);
                default -> bodyRequest.put(key, valueList.get(key));
            }
        }

        switch (method) {
            case "GET":
                actor.attemptsTo(Get.resource(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "POST":
                actor.attemptsTo(Post.to(path).with(request -> request.body(bodyRequest).header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "PUT":
                actor.attemptsTo(Put.to(path).with(request -> request.body(bodyRequest).header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "DELETE":
                actor.attemptsTo(Delete.from(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            default:
                throw new IllegalStateException("Unknown method");
        }
    }

    @Given("{actor} call an api {string} with method {string}")
    public void callApi(Actor actor, String path, String method) {
        actor.whoCan(CallAnApi.at(baseURL));

        switch (method) {
            case "GET":
                actor.attemptsTo(Get.resource(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "POST":
                actor.attemptsTo(Post.to(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "PUT":
                actor.attemptsTo(Put.to(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            case "DELETE":
                actor.attemptsTo(Delete.from(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken()).log().all()));
                break;
            default:
                throw new IllegalStateException("Unknown method");
        }
    }

    @Then("{actor} verify response is match with json schema {string}")
    public void userVerifyResponseIsMatchWithJsonSchema(Actor actor, String schema) {
        Response response = SerenityRest.lastResponse();
        response.then().body(matchesJsonSchemaInClasspath(schema));
    }

    @Then("{actor} verify status code is {int}")
    public void userVerifyStatusCodeIs(Actor actor, int statusCode) {
        Response response = SerenityRest.lastResponse();
        response.then().log().all().statusCode(statusCode);
    }

    @And("{actor} send image to {string}")
    public void userSendImageTo(Actor actor, String path) {
        actor.whoCan(CallAnApi.at(baseURL));

        File imageFile = new File(System.getProperty("user.dir") + "/bg-presentasi mini project batch 4.png");
        actor.attemptsTo(Post.to(path).with(request -> {
            return request
                    .header("Authorization", "Bearer " + user.getToken())
                    .contentType("multipart/form-data")
                    .multiPart("image", imageFile, ContentType.IMAGE_PNG.getMimeType());
        }));
    }
    @And("{actor} sending image to {string}")
    public void userSendingImageTo(Actor actor, String path) {
        actor.whoCan(CallAnApi.at(baseURL));

        File imageFile = new File(System.getProperty("user.dir") + "/bg-presentasi mini project batch 4.png");
        actor.attemptsTo(Put.to(path).with(request -> {
            return request
                    .header("Authorization", "Bearer " + user.getToken1())
                    .contentType("multipart/form-data")
                    .multiPart("image", imageFile, ContentType.IMAGE_PNG.getMimeType());
        }));
    }
    @Given("{actor} call an user api {string} with method {string} with payload below")
    public void callUserApi(Actor actor, String path, String method, DataTable table) {
        actor.whoCan(CallAnApi.at(baseURL));

        // Create request body json instance
        JSONObject bodyRequest = new JSONObject();


        // Get headers
        List<List<String>> rowsList = table.asLists(String.class);
        List<String> headerList = rowsList.get(0);

        // Get values
        List<Map<String, String>> rowsMap = table.asMaps(String.class, String.class);
        Map<String, String> valueList = rowsMap.get(0);

        // Loop on every values and set value with key from header to request body
        for (int i = 0; i < valueList.size(); i++) {
            Faker faker = new Faker(new Locale("in-ID"));

            String key = headerList.get(i);

            // check if value correspond to random syntax
            switch (valueList.get(key)) {
                case "randomEmail" -> {
                    String randomEmail = faker.internet().emailAddress();
                    bodyRequest.put(key, randomEmail);
                    user.setEmail(randomEmail);
                }
                case "randomPassword" -> {
                    String randomPassword = faker.internet().password();
                    bodyRequest.put(key, randomPassword);
                    user.setPassword(randomPassword);
                }
                case "randomFullname" -> {
                    String randomFullname = faker.name().fullName();
                    bodyRequest.put(key, randomFullname);
                    user.setFullName(randomFullname);
                }
                case "randomProductName" -> bodyRequest.put(key, faker.commerce().productName());
                case "randomProductDescription" -> bodyRequest.put(key, faker.lorem().sentence());
                case "randomProductStock" -> bodyRequest.put(key, faker.random().nextInt(1, 100));
                case "randomPrice" -> bodyRequest.put(key, faker.commerce().price());
                case "userEmail" -> bodyRequest.put(key, user.getEmail());
                case "userPassword" -> bodyRequest.put(key, user.getPassword());
                case "randomName" -> bodyRequest.put(key, faker.name().fullName());
                case "randomPhone" -> bodyRequest.put(key, faker.phoneNumber().subscriberNumber(12));
                case "randomCity" -> bodyRequest.put(key, faker.address().cityName());
                case "randomProvince" -> bodyRequest.put(key, faker.address().state());
                case "randomAddress" -> bodyRequest.put(key, faker.address().fullAddress());
                case "retypepass" -> bodyRequest.put(key, user.getPassword());
                case "randomArrive" -> bodyRequest.put("arrived_at", formattedTimestamp);
                case "balance"-> bodyRequest.put(key, 1000000);
                case "product_qty" -> bodyRequest.put(key, 1);

                default -> bodyRequest.put(key, valueList.get(key));
            }
        }

        switch (method) {
            case "GET":
                actor.attemptsTo(Get.resource(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "POST":
                actor.attemptsTo(Post.to(path).with(request -> request.body(bodyRequest).header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "PUT":
                actor.attemptsTo(Put.to(path).with(request -> request.body(bodyRequest).header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "DELETE":
                actor.attemptsTo(Delete.from(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            default:
                throw new IllegalStateException("Unknown method");
        }
    }

    @Given("{actor} call an user api {string} with method {string}")
    public void callUserApi(Actor actor, String path, String method) {
        actor.whoCan(CallAnApi.at(baseURL));

        switch (method) {
            case "GET":
                actor.attemptsTo(Get.resource(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "POST":
                actor.attemptsTo(Post.to(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "PUT":
                actor.attemptsTo(Put.to(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            case "DELETE":
                actor.attemptsTo(Delete.from(path).with(request -> request.header("Authorization", "Bearer "+ user.getToken1()).log().all()));
                break;
            default:
                throw new IllegalStateException("Unknown method");
        }
    }
    @Given("{actor} create new product to {string}")
    public void userCreateNewProductTo(Actor actor, String path) {
        actor.whoCan(CallAnApi.at(baseURL));

        Faker faker = new Faker();

        Integer RandomPrice = faker.random().nextInt(1000, 10000);
        String RandomName = faker.commerce().productName();
        String RandomDesc = faker.lorem().sentence();
        Integer RandomStock = faker.random().nextInt(1, 100);

        actor.attemptsTo(Post.to(path).with(request -> {
            return request
                    .header("Authorization", "Bearer " + user.getToken()).log().all()
                    .contentType("multipart/form-data")
                    .multiPart("price", RandomPrice)
                    .multiPart("name", RandomName)
                    .multiPart("description", RandomDesc)
                    .multiPart("stock", RandomStock)
                    .multiPart("image", new File(System.getProperty("user.dir") + "/bg-presentasi mini project batch 4.png"), ContentType.IMAGE_PNG.getMimeType());
        }));
    }
}