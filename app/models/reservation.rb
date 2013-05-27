class Reservation < ActiveRecord::Base
	belongs_to :nurse
	belongs_to :examination
	belongs_to :doctor
	belongs_to :examination_time
end