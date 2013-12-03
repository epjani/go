class DashboardsController < ApplicationController

	def index
		@doctors = @nurse.get_doctors
		sel_date = params[:selected_date].blank? ? DateTime.now : params[:selected_date].to_date
		@selected_date = sel_date.strftime("%d.%m.%Y")
		@doctor_id = params[:doctor_id].blank? ? (@doctors.empty? ? nil : @doctors.first.id) : params[:doctor_id]
		@doctor_name = Doctor.find(@doctor_id).full_name if @doctor_id
		@shift = params[:shift].blank? ? 1 : params[:shift].to_i
		@reservations = @doctors.empty? ? [] : @nurse.get_reservations(sel_date, @doctor_id, @shift)
		
		puts @reservations.inspect
	end

end