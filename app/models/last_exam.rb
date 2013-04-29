class LastExam < ActiveRecord::Base
  attr_accessible :dilation, :effacement, :exam_time, :patient_id, :station
  
  belongs_to :patient
end
