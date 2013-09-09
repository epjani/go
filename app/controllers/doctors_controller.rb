class DoctorsController <  ApplicationController
	disable_layout_for_ajax

	def index
		@doctors = @nurse.get_doctors
	end

	def new
	end

	def create
		@nurse.create_doctor(params[:first_name], params[:last_name])
		redirect_to nurse_doctors_path(@nurse.id)
	end

	def destroy
		@nurse.delete_doctor(params[:id])
		redirect_to nurse_doctors_path(@nurse.id)
	end

	def edit
		@selected_doctor = Doctor.find params[:id]
	end

	def update
		@nurse.edit_doctor(params[:selected_doctor], params[:first_name], params[:last_name])
		redirect_to nurse_doctors_path(params[:nurse_id])
	end
end