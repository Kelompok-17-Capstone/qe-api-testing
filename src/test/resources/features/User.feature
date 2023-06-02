Feature: User Capstone API

  @CapsAPI @UserCaps @Home
  Scenario: User send request GET Home
    Given User call an api "/home" with method "GET"
    Then User verify status code is 404
    Then User verify response is match with json schema "gethome.json"

  @CapsAPI @UserCaps @GetProducts
  Scenario: User send request GET Products
    Given User call an api "/products" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema ""

  @CapsAPI @UserCaps @GetProductsDetails
  Scenario: User send request GET Product by ID
    Given User call an api "/products/1" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema ""

  @CapsAPI @UserCaps @CreateOrders
  Scenario: User Create Product Orders
    Given User call an api "/products/1" with method "GET" with payload below
    Then User verify status code is 200
    Then User verify response is match with json schema ""