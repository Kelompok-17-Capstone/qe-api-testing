Feature: Admin Capstone API

  @CapsAPI @AdminCaps @Dashboard
  Scenario: Admin GET Dashboard
    Given User call an api "/admin/dashboard" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetDashboard.json"

###############################################################################################################

  @CapsAPI @AdminCaps @Products
  Scenario: Admin create product
    Given User create new product to "/admin/products"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"


  @CapsAPI @AdminCaps @Products
  Scenario: Admin edit product by id
    Given User call an api "/admin/products/1ed7d171-c6dc-4def-97a4-b1e9fdcf6b82" with method "PUT" with payload below
      | name              |
      | randomProductName |
    And User send image to "/admin/products/1ed7d171-c6dc-4def-97a4-b1e9fdcf6b82"
    Then User verify status code is 200
    Then User verify response is match with json schema "CreateProduct.json"

  @CapsAPI @AdminCaps @Products
  Scenario: Admin delete product by id
    Given User call an api "/admin/products/4b6f9159-e1e9-457e-810e-a2fc3d1b9f18" with method "DELETE"
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
    Given User call an api "/admin/users/2" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsersbyId.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get users informations by keyword
    Given User call an api "/admin/users?keyword=Heni" with method "GET"
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
    Given User call an api "/admin/users?role=reguler&keyword=Heni" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin get member users informations by keyword
    Given User call an api "/admin/users?role=member&keyword=test" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetUsers.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin edit user by id
    Given User call an api "/admin/users/36" with method "PUT" with payload below
      | name       | phone_number | city       | province      | address       | status |
      | randomName | randomPhone  | randomCity | randomProvince| randomAddress | member |
    Then User verify status code is 200
    Then User verify response is match with json schema "EditUser.json"

  @CapsAPI @AdminCaps @Users
  Scenario: Admin delete user by id
    Given User call an api "/admin/users/42" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "DelUsers.json"

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
    Given User call an api "/admin/orders/d83a6a46-cede-466e-86de-2bd9d4569488" with method "PUT" with payload below
    | status  | arrived_at   |
    | dikirim | randomArrive |
    Then User verify status code is 200
    Then User verify response is match with json schema "EditOrder.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders dikirim
    Given User call an api "/admin/orders/dikirim" with method "GET"
    Then User verify status code is 400
    Then User verify response is match with json schema "GetOrderAdmin.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin get orders diterima
    Given User call an api "/admin/orders/diterima" with method "GET"
    Then User verify status code is 400
    Then User verify response is match with json schema "EditOrder.json"

  @CapsAPI @AdminCaps @Orders
  Scenario: Admin delete order by id
    Given User call an api "/admin/orders/f3ae4e15-b06b-4bc9-bc13-23cc7a29f325" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "EditOrder.json"