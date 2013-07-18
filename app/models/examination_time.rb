class ExaminationTime < ActiveRecord::Base
	attr_accessible :examination_time, :shift
	has_many :reservations
end