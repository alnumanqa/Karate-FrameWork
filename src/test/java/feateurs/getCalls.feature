Feature: EnthrallIT Students API Validation

  Background: 
    Given url 'http://localhost:3000'
	
	@Students
  Scenario: Validate palyers Endpoint status 200
    Given path '/students'
    When method GET
    Then status 200
    And match response[0].id == 1
    And match response[0].name == 'Numan'
    And match response[0].grade == 'A'
    And match response[0].langague == 'java'
