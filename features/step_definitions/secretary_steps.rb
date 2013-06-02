## UTILITY METHODS ###
def create_secretary
  @user = FactoryGirl.create(:user, email: 'secretary@purple.com', password: 'secretary2013', password_confirmation: 'secretary2013')
  @user.add_role :secretary
end

### GIVEN ###
Given(/^I have been assigned role as a secretary$/) do
  create_secretary
end

### WHEN ###

When(/^I log in with valid credentials$/) do
  sign_in
end

### THEN ###
Then(/^I should be on the patient registration page$/) do
  visit new_patient_path
end
