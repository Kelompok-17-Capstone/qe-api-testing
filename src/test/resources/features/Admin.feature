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
      | name              | description              | stock               | price       |
      | randomProductName | randomProductDescription | randomProductStock  | randomPrice |
    And User send image to "/admin/products"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin edit product by id
    Given User call an api "/admin/products/08a9844d-f0d1-4b24-8b1a-b911b9f4d261" with method "PUT" with payload below
      | name              |
      | randomProductName |
    And User sending image to "/admin/products/08a9844d-f0d1-4b24-8b1a-b911b9f4d261"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin delete product by id
    Given User call an api "/admin/products/13e34b5d-7d9f-4088-b5f0-e1f41110fd5d" with method "DELETE"
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
    Then User verify response is match with json schema "ProductAbis.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get available product with keyword
    Given User call an api "/admin/products?status=tersedia&keyword=keyboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin get unavailable product with keyword
    Given User call an api "/admin/products?status=habis&keyword=keyboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "ProductAbis.json"

###############################################################################################################

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations
    Given User call an api "/admin/users" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations by id
    Given User call an api "/admin/users/4" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsersbyId.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations by keyword
    Given User call an api "/admin/users?keyword=Anita" with method "GET"
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
    Given User call an api "/admin/users?role=reguler&keyword=Dion" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get member users informations by keyword
    Given User call an api "/admin/users?role=member&keyword=Dion" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin edit user by id
    Given User call an api "/admin/users/4" with method "PUT" with payload below
      | name       | phone_number | city       | province      | address       | status |
      | randomName | randomPhone  | randomCity | randomProvince| randomAddress | member |
    Then User verify status code is 200
    Then User verify response is match with json schema "EditUser.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin delete user by id
    Given User call an api "/admin/users/3" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "EditUsers.json"

############################################################################################################

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders
    Given User call an api "/admin/orders" with method "GET"
    Then User verify status code is 201
    Then User verify response is match with json schema "GetOrderAdmin.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders dikemas
    Given User call an api "/admin/orders?status=dikemas" with method "GET"
    Then User verify status code is 201
    Then User verify response is match with json schema "GetOrderAdmin.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin edit order by id
    Given User call an api "/admin/orders/41bff284-eb9b-403c-ba47-754da545d67b" with method "PUT" with payload below
    | status  | arrived_at   |
    | diterima | randomArrive |
    Then User verify status code is 200
    Then User verify response is match with json schema "EditOrder.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders dikirim
    Given User call an api "/admin/orders/dikirim" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetOrderAdmin.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders diterima
    Given User call an api "/admin/orders/diterima" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetOrderAdmin.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin delete order by id
    Given User call an api "/admin/orders/02fa257a-9c8e-4cef-8bda-574541c2e4bc" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "EditOrder.json"