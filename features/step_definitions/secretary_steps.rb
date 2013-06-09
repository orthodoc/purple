## UTILITY METHODS ###
def create_visitor_as_secretary
  @secretary ||= {name: "Testy Secretary", email: "secretary@purple.com", password: "secretary2013", password_confirmation: "secretary2013" } 
end

def delete_secretary
  @user ||= User.first conditions: {email: @secretary[:email]}
  @user.destroy unless @user.nil?
end

def create_secretary
  create_visitor_as_secretary
  delete_secretary
  @user = FactoryGirl.create(:user, email: @secretary[:email], password: @secretary[:password], password_confirmation: @secretary[:password_confirmation])
  @user.add_role :secretary
end

def sign_in_as_secretary
  visit "/users/sign_in"
  fill_in "Email", with: @secretary[:email]
  fill_in "Password", with: @secretary[:password]
  click_button "Sign in"
  visit patients_path
end

def build_patient
  @patient = FactoryGirl.build(:patient)
end

def create_patient
  @patient = FactoryGirl.create(:patient)
end

### GIVEN ###
Given(/^I have been assigned role as a secretary$/) do
  create_secretary
end

### WHEN ###

When(/^I log in with valid credentials$/) do
  sign_in_as_secretary
end

When(/^I register a new patient$/) do
  build_patient
  create_secretary
  sign_in_as_secretary
  click_link "New patient"
  fill_in "Name", with: @patient[:name]
  #fill_in "Date of birth", with: @patient[:dob]
  select @patient.gender, from: 'Gender'
  fill_in "Permanent address", with: @patient[:permanent_address]
  fill_in "Communication address", with: @patient[:communication_address]
  fill_in "Mobile number", with: @patient[:mobile_number]
  fill_in "Email", with: @patient[:email]
  click_button "Submit"
end

### THEN ###
Then(/^I should be on the patients page$/) do
  visit patients_path
end

Then(/^I should see the page for the new patient$/) do
  create_patient
  visit ( patient_path(Patient.last) )
end

Then(/^I should see the patient details$/) do
  page.has_content?(@patient.name)
  page.has_content?(@patient.age)
  page.has_content?(@patient.gender)
end

Then(/^I should see a successful flash notice for patient registration$/) do
  page.has_content?("Patient #{@patient.name} successfully added.")
end
