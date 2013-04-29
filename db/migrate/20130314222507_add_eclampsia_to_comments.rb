class AddEclampsiaToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mild_pre, :boolean
    add_column :comments, :sev_pre, :boolean
    add_column :comments, :pre_bp, :integer
    add_column :comments, :pre_plat, :integer
    add_column :comments, :pre_when, :datetime
    add_column :comments, :e_bp, :integer
    add_column :comments, :e_plat, :integer
    add_column :comments, :e_when, :datetime  
  end
end
