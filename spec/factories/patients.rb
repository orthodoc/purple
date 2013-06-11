# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    name "Test Patient"
    #sequence(:dob)  {|n| n + 18.years.ago}
    sequence(:age)  {|n| n + 12}
    gender "Male"
    permanent_address "MyString"
    communication_address "MyString"
    sequence(:mobile_number) {|n| n + 1221}
    sequence(:email)         {|n| "test_patient#{n}@purple.com"}
  end
end
