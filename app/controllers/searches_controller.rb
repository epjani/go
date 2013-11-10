class SearchesController < ApplicationController

	def index
		@reservations = []
		@doctors = @nurse.get_doctors
		
		unless params[:q].blank?
			@reservations = @nurse.get_structured_reservations(@nurse.search(params[:q]))
		end
		@doctor_id = params[:doctor_id]
		@selected_date = params[:selected_date]
		@shift = params[:shift].blank? ? 1 : params[:shift].to_i
	end

end
