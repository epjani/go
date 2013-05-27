class DashboardsController < ApplicationController
	def index
		@doctors = @nurse.get_doctors
		@reservations = @nurse.get_reservations
	end
end