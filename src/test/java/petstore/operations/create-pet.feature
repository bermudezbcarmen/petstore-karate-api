@ignore
Feature: Create a pet

  Scenario: Create pet

    * def pet = read('classpath:petstore/data/create-pet.json')

    * set pet.id = petId
    * set pet.name = petName

    Given url baseUrl
    And path 'pet'
    And request pet

    When method post

    Then status 200

    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'

    * def createdPet = response