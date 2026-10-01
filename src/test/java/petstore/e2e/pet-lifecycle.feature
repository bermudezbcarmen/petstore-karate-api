Feature: Pet lifecycle in PetStore

  Background:

    * def petId = java.lang.System.currentTimeMillis()
    * def petName = 'KaratePet-' + petId
    * def updatedPetName = 'KaratePet-Sold-' + petId


  Scenario: Create, retrieve, update and find a pet

    # ---------------------------------------------------------
    # CREATE
    # ---------------------------------------------------------

    * def createResult = call read('classpath:petstore/operations/create-pet.feature') { petId: '#(petId)', petName: '#(petName)' }

    * def createdPet = createResult.createdPet


    # ---------------------------------------------------------
    # GET BY ID
    # ---------------------------------------------------------

    * def getResult = call read('classpath:petstore/operations/get-pet-by-id.feature')
      """
      {
        petId: '#(petId)',
        expectedName: '#(petName)',
        expectedStatus: 'available'
      }
      """


    # ---------------------------------------------------------
    # UPDATE
    # ---------------------------------------------------------

    * def updateResult = call read('classpath:petstore/operations/update-pet.feature')
      """
      {
        petId: '#(petId)',
        updatedPetName: '#(updatedPetName)'
      }
      """

    * def updatedPet = updateResult.updatedPet


    # ---------------------------------------------------------
    # FIND BY STATUS
    # ---------------------------------------------------------

    * def findResult = call read('classpath:petstore/operations/find-pet-by-status.feature')
      """
      {
        petId: '#(petId)',
        petStatus: 'sold',
        expectedName: '#(updatedPetName)'
      }
      """


    # ---------------------------------------------------------
    # CLEANUP
    # ---------------------------------------------------------

    * call read('classpath:petstore/operations/delete-pet.feature') { petId: '#(petId)' }
