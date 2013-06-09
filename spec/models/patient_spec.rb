require 'spec_helper'

describe Patient do

  before(:each) do
    @patient = FactoryGirl.create(:patient)
  end

  subject { @patient }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:age, :gender, :mobile_number, :email) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:gender) }

end
