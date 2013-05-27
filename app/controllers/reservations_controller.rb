class ReservationsController <  ApplicationController
	disable_layout_for_ajax

	def index
		@doctors = @nurse.get_doctors
	end

	def new
		@doctors = @nurse.get_doctors
		@examinations = @nurse.get_examinations
		@examination_times = @nurse.get_examination_times
	end

	def create
		@nurse.create_reservation(params[:first_name], params[:last_name], params[:phone], params[:birthday], params[:doctor_id], params[:examination_id], params[:examination_time_id])
		redirect_to nurse_dashboard_path(@nurse.id)
	end

	def destroy
		@nurse.delete_examination(params[:id])
	end
end