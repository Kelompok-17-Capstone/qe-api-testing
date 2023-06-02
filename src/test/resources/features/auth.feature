Feature: Authentication Capstone API

  @CapsAPI @AuthCaps @Register
  Scenario: User register with randomize identity
    Given User call an api "/register" with method "POST" with payload below
      | email | password | retype_password |
      | kljssASDdad@gmail.com | 123456789 | 123456789 |
    Then User verify status code is 200
    Then User verify response is match with json schema "register.json"

  @AltaStoreAPI @AuthAlta @Login
  Scenario: User login with given identity
    Given User call an api "/login" with method "POST" with payload below
      | email | password |
      | admin | admin |
    Then User verify status code is 200
    Then User verify response is match with json schema "login.json"