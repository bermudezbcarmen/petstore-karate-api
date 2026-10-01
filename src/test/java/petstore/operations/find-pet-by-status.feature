@ignore
Feature: Find pet by status

  Scenario: Find pet by status

    Given url baseUrl
    And path 'pet', 'findByStatus'
    And param status = petStatus

    When method get

    Then status 200
    And match response == '#array'

    * def matchingPets =
    """
    karate.filter(response, function(x) {
        return x.id == petId;
    })
    """

    And match matchingPets != []
    And match matchingPets[0].id == petId
    And match matchingPets[0].name == expectedName
    And match matchingPets[0].status == petStatus

    * def foundPet = matchingPets[0]