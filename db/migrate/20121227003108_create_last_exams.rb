class CreateLastExams < ActiveRecord::Migration
  def change
    create_table :last_exams do |t|
      t.datetime :exam_time
      t.integer :dilation
      t.integer :effacement
      t.integer :station
      t.integer :patient_id

      t.timestamps
    end
  end
end
