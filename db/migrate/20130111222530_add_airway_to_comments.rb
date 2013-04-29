class AddAirwayToComments < ActiveRecord::Migration
  def change
    add_column :comments, :airway, :boolean
  end
end
