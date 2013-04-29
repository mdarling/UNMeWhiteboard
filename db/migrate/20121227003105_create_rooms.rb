class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.boolean :room_occupied
      t.integer :position

      t.timestamps
    end
  end
end
