class ReservationsController <  ApplicationController
	disable_layout_for_ajax

	def index
		@doctors = @nurse.get_doctors
	end

	def new
		@doctors = @nurse.get_doctors
		@examinations = @nurse.get_examinations
		@examination_times = @nurse.get_examination_times
		@reservation_date = params[:selected_date]
		@doctor_id = params[:doctor_id].blank? ? nil : params[:doctor_id]
		@examination_time = params[:examination_time].blank? ? nil : params[:examination_time]
	end

	def create
		@nurse.create_reservation(params[:first_name], params[:last_name], params[:phone], params[:birthday], params[:doctor_id], params[:examination_id], params[:examination_time_id], params[:reservation_date])
		redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id]})
	end

	def destroy
		@nurse.delete_reservation(params[:id])
		redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id]})
	end

	def edit
		@doctors = @nurse.get_doctors
		@examination_times = @nurse.get_examination_times
		@examinations = @nurse.get_examinations
		@reservation = Reservation.find(params[:id])
	end

	def update
		@nurse.edit_reservation(params[:id], params[:first_name], params[:last_name], params[:phone], params[:birthday], params[:doctor_id], params[:examination_id], params[:examination_time_id], params[:reservation_date])
		redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id]})
	end

end