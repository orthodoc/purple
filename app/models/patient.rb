class Patient < ActiveRecord::Base
  resourcify
  attr_accessible :communication_address, :dob, :email, :gender, :mobile_number, :name, :permanent_address, :age
  validates :name,   presence: true,
                     uniqueness: { scope: [:age, :mobile_number] },
                     format: { with: /[a-zA-z]+[\s]/, message: "only letters allowed"},
                     length: { minimum: 3 }
  validates :age,    presence: true,
                     numericality: true,
                     inclusion: { in: 12..120 }
  validates :gender, presence: true,
                     inclusion: { in: %w(Male Female Others), message: "%{value} is not valid gender" },
                     allow_nil: false
end
