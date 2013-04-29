class AddPatientIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :patient_id, :integer
  end
end
