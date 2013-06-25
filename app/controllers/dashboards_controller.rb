class DashboardsController < ApplicationController

	def index
		@doctors = @nurse.get_doctors
		@selected_date = params[:selected_date].blank? ? DateTime.now.strftime("%Y/%m/%d") : params[:selected_date].to_date
		@doctor_id = params[:doctor_id].blank? ? @doctors.first.id : params[:doctor_id]
		@doctor_name = Doctor.find(@doctor_id).full_name
		@reservations = @doctors.empty? ? [] : @nurse.get_reservations(@selected_date, @doctor_id)
	end

end