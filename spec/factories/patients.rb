# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    sequence(:name) {|n| "Test Patient#{n}"}
    #sequence(:dob)  {|n| n + 18.years.ago}
    sequence(:age)  {|n| n + 18}
    gender "Male"
    permanent_address "MyString"
    communication_address "MyString"
    sequence(:mobile_number) {|n| n + 1221}
    sequence(:email)         {|n| "test_patient#{n}@purple.com"}
  end
end
