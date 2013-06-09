class RenameEmailIdOnPatientsToEmail < ActiveRecord::Migration
  def change
    rename_column :patients, :email_id, :email
  end
end
