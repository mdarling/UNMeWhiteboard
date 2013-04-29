class ChangeCardiacNotesToText < ActiveRecord::Migration
  def up
   change_table :comments do |t|
      t.change :cardiac_disease_free_text, :string
    end
  end

  def down
  end
end
