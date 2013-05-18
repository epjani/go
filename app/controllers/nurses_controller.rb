class NursesController < BaseController
	
	def index
	end

	def login
		nurse = Nurse.find_by_username_and_hash_code(params[:username], Digest::SHA256.hexdigest(params[:password]))
		p nurse.inspect
		if nurse
			session[:id] = nurse.id
			redirect_to nurse_dashboard_path(nurse.id)
		end
	end
end