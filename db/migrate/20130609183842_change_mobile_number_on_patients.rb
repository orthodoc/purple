class ChangeMobileNumberOnPatients < ActiveRecord::Migration
  def up
    remove_column :patients, :mobile_number
    add_column :patients, :mobile_number, :integer
  end

  def down
    remove_column :patients, :mobile_number
    add_column :patients, :mobile_number, :string
  end
end
