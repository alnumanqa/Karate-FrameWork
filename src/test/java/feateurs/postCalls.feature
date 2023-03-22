Feature: EnthrallIT Students API Validation

  Background: 
    Given url 'http://localhost:3000'
    Given path '/students'
    And header Accept = 'application/json'

  @body
  Scenario: Add student into students endpiont
    * def body =
      """
      { 
          "id": 19,
          "name": "Alam",
          "grade": "B",
          "langague": [
              "ruby",
              "python"
          ]
      }
      """
    And request body
    When method POST
    Then status 201

  @json-payload
  Scenario: Add student from json file
    * def payload = read('classpath:students.json')
    * set payload.name = 'Imran'
    * set payload.grade = 'A-'
    * set payload.langague = 'ruby'
    Given request payload
    When method POST
    Then status 201

  @data-driven
  Scenario Outline: Add multiple students <name>
    * def payload = read('classpath:students.json')
    * set payload.name = <name>
    * set payload.grade = <grade>
    * set payload.langague = <langague>
    Given request payload
    When method POST
    Then status 201

    Examples: 
      | name    | grade | langague |
      | 'Nuhas' | 'A'   | 'java'   |
      | 'Nuhin' | 'A'   | 'python' |
