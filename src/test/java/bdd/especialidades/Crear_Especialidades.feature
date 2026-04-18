@Especialidades
Feature: Especialidades

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'

    * def auth = karate.callSingle('classpath:bdd/auth/login.feature')
    * header Authorization = 'Bearer ' + auth.response.token

  Scenario Outline: Crear especialidad
    Given path '/v1/catalog/specialties'
    And request
      """
        {
          "name": "<name>",
          "description": "<description>",
          "isActive": <isActive>
        }
      """
    When method post
    Then status 200
    And match response ==
      """
      {
        "specialtyId": "#uuid",
        "clinicId": "#uuid",
        "name": "#string",
        "description": "#string",
        "isActive": "#boolean"
      }
      """

    Examples:
      | name             | description                          | isActive |
      | Cardiología      | Especialidad del corazón             | true     |
      | Dermatología     | Cuidado de la piel                   | true     |
      | Ginecología      | Salud integral femenina              | true     |
      | Medicina General | Atención integral de salud           | true     |
      | Nutrición        | Alimentación saludable personalizada | true     |
      | Oftalmología     | Salud visual especializada           | true     |
      | Traumatología    | Lesiones óseas y articulares         | true     |