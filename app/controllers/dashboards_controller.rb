class DashboardsController < ApplicationController
	disable_layout_for_ajax
	def index
		@doctors = @nurse.get_doctors
		@selected_date = params[:selected_date].blank? ? nil : params[:selected_date].to_date
		@doctor_id = params[:doctor_id].blank? ? nil : params[:doctor_id]

		@reservations = @nurse.get_reservations(@selected_date, @doctor_id)
	end
end