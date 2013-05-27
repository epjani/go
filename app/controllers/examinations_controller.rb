class ExaminationsController <  ApplicationController
	disable_layout_for_ajax

	def index
		@doctors = @nurse.get_doctors
		@examinations = @nurse.get_examinations
	end

	def new
	end

	def create
		@nurse.create_examination(params[:name], params[:description])
		redirect_to nurse_examinations_path(@nurse.id)
	end

	def destroy
		@nurse.delete_examination(params[:id])
		redirect_to nurse_examinations_path(@nurse.id)
	end
end