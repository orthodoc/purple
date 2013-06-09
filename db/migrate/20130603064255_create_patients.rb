class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.string :permanent_address
      t.string :communication_address
      t.string :mobile_number
      t.string :email_id

      t.timestamps
    end
  end
end
