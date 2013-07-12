class SearchesController < ApplicationController

	def index
		@reservations = []
		@doctors = @nurse.get_doctors
		
		unless params[:q].blank?
			@reservations = @nurse.search(params[:q])
		end
		@doctor_id = params[:doctor_id]
		@selected_date = params[:selected_date]
	end

end