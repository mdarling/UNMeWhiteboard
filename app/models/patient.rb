class Patient < ActiveRecord::Base
  attr_accessible :comment_attributes, :anesthesia_interview, :attending_id, :blood_type, :body_mass_index, :current_dilation, :current_effacement, :current_station, :est_gest_age, :first_name, :gravidity, :group_b_strep, :last_exam, :last_name, :membrane, :nurse_id, :parity, :room_id 
  
  belongs_to :attending
  belongs_to :nurse
  belongs_to :room
  
  before_save :save_exam_data
  
  #validates :body_mass_index, :numericality => { :greater_than_or_equal_to => 10}
  validates :first_name, :last_name, :presence => true
  
  has_many :last_exams, dependent: :destroy
  has_one :comment, dependent: :destroy
  
  accepts_nested_attributes_for :last_exams
  accepts_nested_attributes_for :comment
  
  def ANESTHESIA_INTERVIEWS
    [["NONE","NONE"], ["EPI","EPI"], ["CSE", "CSE"],["IT","IT"], ["W","W"]].freeze
  end

  def BLOOD_TYPES
		[["O+", "O+"], ["O-", "O-"], ["A+", "A+"],["A-", "A-"],["B+","B+"],["B-","B-"],["AB+","AB+"],	["AB-","AB-"]]
  end
  
	def GROUP_B_STREPS
		[["POS","POS"],["NEG","NEG"]].freeze
  end
  
  def MEMBRANES
    [["INT","INT"], ["BULG","BULG"], ["RUPT","RUPT"], ["PP","PP"]].freeze
  end

	def DILATIONS
		[["0", "0"],["1", "1"],["2", "2"],["3","3"],["4","4"],["5","5"],["6","6"],["7", "7"],["8","8"],["9","9"],["10","10"]].freeze
	end

	def EFFACEMENTS
		[["0","0"], ["10","10"], ["20","20"], ["30","30"], ["40","40"], ["50","50"], ["60","60"], ["70","70"], ["80","80"], ["90","90"], ["100","100"]].freeze
	end

	def STATIONS
		[["-5",-5], ["-4",-4], ["-3",-3], ["-2", -2], ["-1",-1], [0,0], ["+1",+1], ["+2",+2], ["+3",+3], ["+4",+4], ["+5",+5]].freeze
	end

	def GRAVIDITIES
		[[1,"1"], [2,"2"], [3,"3"], [4,"4"], [5,"5"], [6,"6"], [7,"7"], [8,"8"], [9,"9"], [10,"10"]].freeze
	end

	def PARITIES
		[[0,"0"], [1,"1"], [2,"2"], [3,"3"], [4,"4"], [5,"5"], [6,"6"], [7,"7"], [8,"8"], [9,"9"], [10,"10"]].freeze
	end
  
  def name_with_initial
    "#{first_name.first}. #{last_name}"
	end

	def assigned_nurse
		unless self.nurse_id == nil 
			current_nurse = Nurse.find(:first, :conditions => ["id = ?", self.nurse_id])
			return current_nurse.name_with_initial
		else
			return nil
		end
	end
	
	def assigned_attending
		unless self.attending_id == nil 
			current_attending = Attending.find(:first, :conditions => ["id = ?", self.attending_id])
			return current_attending.name_with_initial
		else
			return nil
		end
	end
	
  private
  	
    def save_exam_data
      #cannot pop a nil, comparisons will result in an error
      unless self.last_exams.size == 0
      
        old_exam_data = self.last_exams.pop
      
        if old_exam_data.dilation == self.current_dilation && old_exam_data.effacement == self.current_effacement && old_exam_data.station == self.current_station
          self.last_exams.push old_exam_data
        else
          new_exam_data = LastExam.new
          
          new_exam_data.dilation = self.current_dilation
          new_exam_data.effacement = self.current_effacement
          new_exam_data.station = self.current_station
          new_exam_data.exam_time = self.last_exam
          
          self.last_exams.push old_exam_data
          self.last_exams.push new_exam_data
          
        end
      
      else
        new_exam_data = LastExam.new
        
        new_exam_data.dilation = self.current_dilation
        new_exam_data.effacement = self.current_effacement
        new_exam_data.station = self.current_station
        new_exam_data.exam_time = self.last_exam

        self.last_exams.push new_exam_data
      end      
    end
end
