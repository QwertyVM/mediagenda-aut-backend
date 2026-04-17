Feature: Metodos de pago

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'

    * def auth = karate.callSingle('classpath:bdd/auth/login.feature')
    * header Authorization = 'Bearer ' + auth.response.token
    Given path '/v1/payment-methods'

  Scenario: Obtener listado de roles
    When method get
    Then status 200