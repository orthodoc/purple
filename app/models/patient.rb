class Patient < ActiveRecord::Base
  resourcify
  attr_accessible :communication_address, :dob, :email, :gender, :mobile_number, :name, :permanent_address, :age
  validates :name, presence: true,
                   uniqueness: {scope: [:age, :gender, :mobile_number]}
  validates_presence_of :gender, :age 
end
