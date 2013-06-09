Feature: Registering a patient
  In order to register a patient
  A secretary
  Should be able to register a patient

  Scenario: Secretary sign in
    Given I exist as a user
    And I have been assigned role as a secretary
    When I log in with valid credentials
    Then I should be on the patients page

  Scenario: Register new patient
    When I register a new patient
    Then I should see the page for the new patient
    And I should see the patient details
    And I should see a successful flash notice for patient registration
