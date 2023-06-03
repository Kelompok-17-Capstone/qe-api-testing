Feature: Admin Capstone API

  @CapsAPI @AdminCaps @Dashboard
  Scenario: User GET Dashboard
    Given User call an api "/admin/dashboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetDashboard.json"

########################################################################################

  @CapsAPI @AdminCaps @Products
  Scenario: User create product
    Given User call an api "/admin/products" with method "POST" with payload below
      | name | description | stock | price |
      | randomProductName | randomProductDescription | randomProductStock | randomPrice |
    And User send image to "/admin/products"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"