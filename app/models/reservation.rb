class Reservation < ActiveRecord::Base
	belongs_to :nurse
	belongs_to :examination
	belongs_to :doctor
	belongs_to :examination_time

	RESERVATION_STANDARD 	= 0
	RESERVATION_PAUSE	 	= 1
	RESERVATION_CITO		= 2
end