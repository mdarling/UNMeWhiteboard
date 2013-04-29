class AddLmwhToComments < ActiveRecord::Migration
  def change
    add_column :comments, :lmwh_mg, :integer
    add_column :comments, :lmwh_when, :datetime
  end
end
