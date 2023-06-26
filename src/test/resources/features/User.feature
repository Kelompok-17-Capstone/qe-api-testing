Feature: User Capstone API

  @CapsAPI @UserCaps @Profil
  Scenario: User create profile
    Given User call an user api "/login" with method "POST" with payload below
      | email     | password     |
      | userEmail | userPassword |
    Given User call an user api "/profile" with method "POST" with payload below
      | name       | phone_number | city       | province       | address       |
      | randomName | randomPhone  | randomCity | randomProvince | randomAddress |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: Get profile informations
    Given User call an user api "/profile" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProfile.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update status as member
    Given User call an user api "/profile" with method "PUT"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User create photo profile informations
    Given User call an user api "/profile/photo" with method "PUT"
    And User sending image to "/profile/photo"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update name
    Given User call an user api "/profile/name" with method "PUT" with payload below
      | name       |
      | randomName |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update email
    Given User call an user api "/profile/email" with method "PUT" with payload below
      | email       |
      | randomEmail |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update phone number
    Given User call an user api "/profile/phone-number" with method "PUT" with payload below
      | phone_number |
      | randomPhone  |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update password
    Given User call an user api "/profile/password" with method "PUT" with payload below
      | old_password | new_password   | retype_password |
      | userPassword | randomPassword | retypepass      |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User create new address
    Given User call an user api "/profile/address" with method "POST" with payload below
      | address       | city       | province       |
      | randomAddress | randomCity | randomProvince |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User update address
    Given User call an user api "/profile/address/25" with method "PUT" with payload below
      | city       | province       | address        |
      | randomCity | randomProvince | randomAddress  |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Profil
  Scenario: User delete address
    Given User call an user api "/profile/address/26" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

##############################################################################################################

  @CapsAPI @UserCaps @Cart
  Scenario: User add cart
    Given User call an user api "/cart" with method "POST" with payload below
    | product_id                           | quantity    |
    | 1b48941d-e124-4914-a4e5-f6e7c37daf34 | product_qty |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User get cart
    Given User call an user api "/cart" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetCart.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User update qty item by id
    Given User call an user api "/cart/18" with method "PUT" with payload below
      | quantity    |
      | product_qty |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Cart
  Scenario: User delete item on cart by id
    Given User call an user api "/cart/18" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

##############################################################################################################

  @CapsAPI @UserCaps @Favorite
  Scenario: User add favorite product
    Given User call an user api "/favorite" with method "POST" with payload below
    | product_id                           |
    | 1b48941d-e124-4914-a4e5-f6e7c37daf34 |
    Then User verify status code is 201
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Favorite
  Scenario: User get favorite product
    Given User call an user api "/favorite" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetFavorite.json"

  @CapsAPI @UserCaps @Favorite
  Scenario: User delete favorite product
    Given User call an user api "/favorite/20" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

###################################################################################################

  @CapsAPI @UserCaps @Product
  Scenario: User get products
    Given User call an user api "/products" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terbaru
    Given User call an user api "/products?tab=terbaru" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite
    Given User call an user api "/products?tab=terfavorit" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite dengan order termurah
    Given User call an user api "/products?tab=terfavorit&price=asc" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products terfavorite dengan order termahal
    Given User call an user api "/products?tab=terfavorit&price=desc" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductUser.json"

  @CapsAPI @UserCaps @Product
  Scenario: User get products details
    Given User call an user api "/products/256ad242-7d39-402f-a3b0-85d3bacab2cc" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetProductDetails.json"

##########################################################################################################

  @CapsAPI @UserCaps @Orders
  Scenario: User create orders
    Given User call an user api "/orders" with method "POST" with payload below
    | address       | product_id                           | quantity    | coin | cart  |
    | randomAddress | 1b48941d-e124-4914-a4e5-f6e7c37daf34 | product_qty | true | false |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Orders
  Scenario: User get orders
    Given User call an user api "/orders" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

##########################################################################################################

  @CapsAPI @UserCaps @Balance
  Scenario: User top up balance
    Given User call an user api "/topup" with method "POST" with payload below
    | total   |
    | balance |
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Balance
  Scenario: User get balance
    Given User call an user api "/balance" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetBalance.json"

#############################################################################################################

  @CapsAPI @UserCaps @Coin
  Scenario: User get coin
    Given User call an user api "/coin" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetCoin.json"

##################################################################################################################

  @CapsAPI @UserCaps @Notif
  Scenario: User get notifications
    Given User call an user api "/notifications" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetNotif.json"

  @CapsAPI @UserCaps @Notif
  Scenario: User get notifications by id
    Given User call an user api "/notifications/51" with method "GET"
    Then User verify status code is 200
    Then User verify response is match with json schema "GetNotifbyID.json"

  @CapsAPI @UserCaps @Notif
  Scenario: User update notifications
    Given User call an user api "/notifications/status/45" with method "PUT"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

  @CapsAPI @UserCaps @Notif
  Scenario: User delete notifications
    Given User call an user api "/notifications/46" with method "DELETE"
    Then User verify status code is 200
    Then User verify response is match with json schema "PutUsertoMember.json"

########################################################################################################

  @CapsAPI @UserCaps @Home
  Scenario: User get home
    Given User call an user api "/home" with method "GET"
    Then User verify status code is 201
    Then User verify response is match with json schema "GetHome.json"

  @CapsAPI @UserCaps @Guest
  Scenario: User get guest
    Given User call an user api "/guest" with method "GET"
    Then User verify status code is 201
    Then User verify response is match with json schema "GetGuest.json"