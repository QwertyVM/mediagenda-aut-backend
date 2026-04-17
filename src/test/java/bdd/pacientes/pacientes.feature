Feature: Pacientes

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'

    * def auth = karate.callSingle('classpath:bdd/auth/login.feature')
    * header Authorization = 'Bearer ' + auth.response.token

  Scenario: Obtener listado de pacientes
    Given path 'v1/patients'
    And param search = ''
    And param page = '0'
    And param size = '10'
    When method get
    Then status 200

