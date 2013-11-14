class ExaminationTime < ActiveRecord::Base
	attr_accessible :examination_time, :shift, :et_index
	has_many :reservations
end