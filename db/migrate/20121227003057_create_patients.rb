class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :last_exam
      t.integer :current_dilation
      t.integer :current_effacement
      t.integer :current_station
      t.string :membrane
      t.decimal :est_gest_age
      t.integer :gravidity
      t.integer :parity
      t.string :group_b_strep
      t.string :blood_type
      t.decimal :body_mass_index
      t.integer :room_id
      t.integer :attending_id
      t.integer :nurse_id

      t.timestamps
    end
  end
end
