class Attending < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  
  has_one :patient
  
   def name_with_initial
    "#{first_name.first}. #{last_name}"
   end
  
end
