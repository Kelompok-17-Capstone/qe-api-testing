Feature: User Capstone API

  @CapsAPI @UserCaps @Profil
    Scenario: Get profile informations
      Given User call an api "/profile" with method "GET"
      Then User verify status code is 200
      Then User verify response is match with json schema "GetProfile.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update status as member
    Given User call an api "/profile" with method "PUT"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User create profile
    Given User call an api "/login" with method "POST" with payload below
      | email | password |
      | iojnmo98nndtgd@gmail.com | 123456789 |
    Given User call an api "/profile" with method "POST" with payload below
      | name | phone_number | city | province | address |
      | pororon | 083893052728 | Garut | Jawa Barat | jl.guntur |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User create photo profile informations
    Given User call an api "/profile/photo" with method "PUT"
    And User sending image to "/profile/photo"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update name
    Given User call an api "/profile/name" with method "PUT"
    | name |
    | yari |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update email
    Given User call an api "/profile/email" with method "PUT"
      | email |
      | yari98719@gmail.com |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update phone number
    Given User call an api "/profile/phone-number" with method "PUT"
      | phone_number |
      | 085214568743 |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update address
    Given User call an api "/profile/address" with method "PUT"
      | city | province | address |
      | bandung | jawa barat | jl.gedung sate |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"


##############################################################################################################

  @CapsAPI @UserCaps @Cart
  Scenario: User add cart
    Given User call an api "/cart" with method "POST" with payload below
      | product_id | quantity |
      | 33222e95-17c3-442a-9e90-46211a619cfc | 3 |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User get cart
    Given User call an api "/cart" with method "GET" with payload below
    Then User verify status code is 200
    Then User verify response is match with json schema "GetCart.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User update qty item by id
    Given User call an api "/cart/1" with method "PUT" with payload below
    | quantity |
    | 1        |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User delete item on cart by id
    Given User call an api "/cart/1" with method "DELETE" with payload below
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

##############################################################################################################

  @CapsAPI @UserCaps @Favorite
  Scenario: User add favorite product
    Given User call an api "/favorite?product_id=33222e95-17c3-442a-9e90-46211a619cfc" with method "POST"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Favorite
  Scenario: User get favorite product
    Given User call an api "/favorite" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetFavorite.json"

  @CapsAPI @UserCaps @Favorite
  Scenario: User delete favorite product
    Given User call an api "/favorite/1" with method "DELETE" with payload below
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

###################################################################################################

  @CapsAPI @UserCaps @Product
  Scenario: User get products
    Given User call an api "/products" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terbaru
    Given User call an api "/products?tab=terbaru" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite
    Given User call an api "/products?tab=terfavorit" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite dengan order termurah
    Given User call an api "/products?tab=terfavorit&price=asc" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite dengan order termahal
    Given User call an api "/products?tab=terfavorit&price=desc" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"