@ignore
Feature: Update a pet

  Scenario: Update pet

    * def pet = read('classpath:petstore/data/update-pet.json')

    * set pet.id = petId
    * set pet.name = updatedPetName
    * set pet.status = 'sold'

    Given url baseUrl
    And path 'pet'
    And request pet

    When method put

    Then status 200

    And match response.id == petId
    And match response.name == updatedPetName
    And match response.status == 'sold'

    * def updatedPet = response