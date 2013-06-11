require 'spec_helper'

describe Patient do

  before(:each) do
    @patient = FactoryGirl.create(:patient)
  end

  subject { @patient }

  it { should validate_presence_of(:name) }
  #it { should validate_uniqueness_of(:name).scoped_to(:age, :mobile_number, :email).with_message(/has already been taken/) }
  it { should_not allow_value('12345').for(:name) }
  it { should ensure_length_of(:name).is_at_least(3)}
  it { should validate_presence_of(:age) }
  it { should validate_numericality_of(:age)}
  it { should ensure_inclusion_of(:age).in_range(12..120)}
  it { should validate_presence_of(:gender) }

end
