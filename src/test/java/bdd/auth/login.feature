Feature: Login

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'
    * configure headers = { 'Content-Type':'application/json' }


  Scenario: Login succesfuly
    Given path 'v1/iam/auth/login'
    And request { "email": "victor@clinic.com", "password": "1234"}
    When method post
    Then status 200
    And match response.email == 'victor@clinic.com'
    And match response contains {token : '#string'}

