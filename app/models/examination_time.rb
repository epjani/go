class ExaminationTime < ActiveRecord::Base
	has_many :reservations
end