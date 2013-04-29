class AddFieldsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :hep_sq_mg, :integer
    add_column :comments, :hep_sq_when, :datetime
    add_column :comments, :hep_iv_mg, :integer
    add_column :comments, :hep_iv_when, :datetime
    add_column :comments, :cs_times, :integer
    
  end
end
