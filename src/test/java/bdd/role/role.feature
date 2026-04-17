Feature: Roles

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'

    * def auth = karate.callSingle('classpath:bdd/auth/role.feature')
    * header Authorization = 'Bearer ' + auth.response.token

    * def uuidRegex = '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'


  Scenario: Obtener listado de roles
    Given path '/v1/iam/roles'
    When method get
    Then status 200
    And match response == '#[3]'
    And match response[*].roleKey contains 'admin'
    And match each response[*].isActive == true
    And match each response[*].roleId == '#regex ' + uuidRegex

