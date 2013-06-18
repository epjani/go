class ExaminationTime < ActiveRecord::Base
	attr_accessible :examination_time
	has_many :reservations
end