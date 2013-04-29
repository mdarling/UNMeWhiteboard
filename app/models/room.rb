class Room < ActiveRecord::Base
  attr_accessible :position, :room_number, :room_occupied
  
  has_one :patient
  accepts_nested_attributes_for :patient
end
