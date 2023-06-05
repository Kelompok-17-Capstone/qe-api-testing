Feature: Admin Capstone API

  @CapsAPI @AdminCaps @Dashboard
  Scenario: Admin GET Dashboard
    Given User call an api "/admin/dashboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetDashboard.json"

###############################################################################################################

  @CapsAPI @AdminCaps @Products
  Scenario: Admin create product
    Given User call an api "/admin/products" with method "POST" with payload below
      | name | description | stock | price |
      | randomProductName | randomProductDescription | randomProductStock | randomPrice |
    And User send image to "/admin/products"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin edit product by id
    Given User call an api "/admin/products/38fb9505-dd7a-4b65-8286-49eeab98e17a" with method "PUT" with payload below
      | name |
      | randomProductName |
    And User send image to "/admin/products"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin delete product by id
    Given User call an api "/admin/products/826c4b0f-fb3c-4e3a-9ee9-c52664c7fd7f" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get product
    Given User call an api "/admin/products" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get product by name
    Given User call an api "/admin/products?keyword=keyboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get product by status available
    Given User call an api "/admin/products?status=tersedia" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get product by status unavailable
    Given User call an api "/admin/products?status=habis" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get available product with keyword
    Given User call an api "/admin/products?status=tersedia&keyword=keyboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get unavailable product with keyword
    Given User call an api "/admin/products?status=habis&keyword=keyboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

###############################################################################################################

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations
    Given User call an api "/admin/users" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations by keyboard
    Given User call an api "/admin/users?keyword=aryo" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get reguler users informations
    Given User call an api "/admin/users?role=reguler" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get member users informations
    Given User call an api "/admin/users?role=member" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get reguler users informations by keyword
    Given User call an api "/admin/users?role=reguler&keyword=aryo" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get member users informations by keyword
    Given User call an api "/admin/users?role=member&keyword=aryo" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"