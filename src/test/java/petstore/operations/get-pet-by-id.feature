@ignore
Feature: Get pet by ID

  Scenario: Get pet

    Given url baseUrl
    And path 'pet', petId

    When method get

    Then status 200

    And match response.id == petId
    And match response.name == expectedName
    And match response.status == expectedStatus

    * def petResponse = response