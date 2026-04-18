@Especialidades
Feature: Especialidades

  Background:
    * url 'https://mediagenda-api-dev.azurewebsites.net'

    * def auth = karate.callSingle('classpath:bdd/auth/login.feature')
    * header Authorization = 'Bearer ' + auth.response.token

  Scenario Outline: Obtener listado de especialidades <nombre>
    Given path '/v1/catalog/specialties'
    And param size = '100'
    When method get
    Then status 200
    # Validar que los campos de paginación sean correctos
    And match response == { content: '#[]', pageable: '#object', last: '#boolean', totalElements: '#number', totalPages: '#number', first: '#boolean', size: '#number', number: '#number', sort: '#object', numberOfElements: '#number', empty: '#boolean' }

    # Validar el esquema de un objeto dentro de 'content'
    * def specialtySchema = { specialtyId: '#uuid', clinicId: '#uuid', name: '#string', description: '#string', isActive: '#boolean' }
    And match each response.content == specialtySchema

    # 2. Filtrar el item específico por nombre desde el content [cite: 42, 53]
    * def item = karate.jsonPath(response, "$.content[?(@.name == '<nombre>')]")[0]

    # 3. Validaciones de integridad y negocio [cite: 54]
    And match item != null
    And match item.description == "<descripcion>"
    And match item.isActive == true


    Examples:
    | nombre           | descripcion                           |
    | Cardiologia      | Cuidado del corazón                   |
    | Dermatología     | Cuidado de la piel                    |
    | Ginecología      | Salud integral femenina               |
    | Medicina General | Atención integral de salud            |
    | Nutrición        | Alimentación saludable personalizada  |
    | Oftalmología     | Salud visual especializada            |
    | Traumatología    | Lesiones óseas y articulares          |