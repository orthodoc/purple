Feature: Registering a patient
  n order to register a patient
  A secretary
  Should be able to register a patient

  Scenario: Secretary sign in
    Given I exist as a user
    And I have been assigned role as a secretary
    When I log in with valid credentials
    Then I should be on the patient registration page
