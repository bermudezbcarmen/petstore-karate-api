@ignore
Feature: Delete pet

  Scenario: Delete pet

    Given url baseUrl
    And path 'pet', petId

    When method delete

    Then status 200