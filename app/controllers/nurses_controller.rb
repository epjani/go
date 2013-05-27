class NursesController < BaseController
	layout "application"
	disable_layout_for_ajax
	
	def index
		@doctors = @nurse.get_doctors
	end

	def login
		nurse = Nurse.find_by_username_and_hash_code(params[:username], Digest::SHA256.hexdigest(params[:password]))
		if nurse
			session[:id] = nurse.id
			redirect_to nurse_dashboard_path(nurse.id)
		end
	end

	def logout
    	reset_session
    	session = nil
    	redirect_to root_url()
  	end
end