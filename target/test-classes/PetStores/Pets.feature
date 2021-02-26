Feature: Proyecto Pets Stores Baufest

  Background:
    * url 'https://petstore.swagger.io/v2/pet/'

  Scenario: create a Pet and then get it by id
    * def Pet =
      """
        {
            "id": 25,
            "category": {
              "id": 25,
              "name": "Big Dog"
            },
            "name": "Dogo Argentino",
            "photoUrls": [
                "string"
                ],
            "tags": [
            {
              "id": 25,
              "name": "Dogo Argentino"
             }
          ],
          "status": "available"
          }
      """

    Given url 'https://petstore.swagger.io/v2/pet/'
    And request Pet
    When method post
    Then status 200

    * def id = response.id
    * def name = response.name
    * def category = response.category
    * def tags = response.tags
    * def status = response.status

    * print 'created id is: ', id
    * print 'created name is: ', name
    * print 'created tag is: ', category
    * print 'created tag is: ', tags
    * print 'created status is: ', status

    Given path id
    When method get
    Then status 200
    And match response contains Pet

    Given path id
    When method get
    Then status 200
    And match response.name contains "Dogo Argentino"
    And match response.category.name contains "Big Dog"

  Scenario: create a Pet and then get it by id
    * def Pet =
      """
        {
            "id": 26,
            "category": {
              "id": 26,
              "name": "Big Dog"
            },
            "name": "Gran Danes",
            "photoUrls": [
                "string"
                ],
            "tags": [
            {
              "id": 26,
              "name": "Gran Danes"
             }
          ],
          "status": "available"
          }
      """

    Given url 'https://petstore.swagger.io/v2/pet/'
    And request Pet
    When method post
    Then status 200

    * def id = response.id
    * def name = response.name
    * def category = response.category
    * def tags = response.tags
    * def status = response.status

    * print 'created id is: ', id
    * print 'created name is: ', name
    * print 'created tag is: ', category
    * print 'created tag is: ', tags
    * print 'created status is: ', status

    Given path id
    When method get
    Then status 200
    And match response contains Pet

    Given path id
    When method get
    Then status 200
    And match response.name contains "Gran Danes"
    And match response.category.name contains "Big Dog"

  Scenario: get Pet with specific id
    Given url 'https://petstore.swagger.io/v2/pet/'

    * def id = 26

    Given path id
    When method get
    Then status 200

    Given path id
    When method get
    Then status 200
    And match response.id contains id

    * def id = response.id
    * def name = response.name
    * def category = response.category
    * def tags = response.tags
    * def status = response.status

    * print 'created id is: ', id
    * print 'created name is: ', name
    * print 'created tag is: ', category
    * print 'created tag is: ', tags
    * print 'created status is: ', status

  Scenario: Update a Pet with specific id
    * def Pet_put =
      """
        {
            "id": 26,
            "category": {
              "id": 26,
              "name": "small dog"
            },
            "name": "Pomerania",
            "photoUrls": [
                "string"
                ],
            "tags": [
            {
              "id": 26,
              "name": "Pomerania"
             }
          ],
          "status": "sold"
          }
      """


    Given url 'https://petstore.swagger.io/v2/pet/'
    And request Pet_put
    When method Put
    Then status 200

    * def id_put = response.id
    * def name_put = response.name
    * def category_put = response.category
    * def tags_put = response.tags
    * def status_put = response.status

    * print 'created id is: ', id_put
    * print 'created name is: ', name_put
    * print 'created tag is: ', category_put
    * print 'created tag is: ', tags_put
    * print 'created status is: ', status_put

    Given path id_put
    When method get
    Then status 200
    And match response.name contains "Pomerania"

    Given path id_put
    When method get
    Then status 200
    And match response contains Pet_put

