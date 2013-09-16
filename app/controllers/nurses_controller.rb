class NursesController < BaseController
	layout "application"
	disable_layout_for_ajax
	
	def index
		@doctors = @nurse.get_doctors
	end

	def new
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]			
		end
	end

	def create
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]
			nurse_role = params[:admin] == "on" ? Nurse::ROLE_ADMIN : Nurse::ROLE_BASIC
			@nurse.create_nurse(params[:first_name], params[:last_name], params[:email], params[:mobile_phone], params[:home_phone], params[:username], params[:password], nurse_role)
		end
		redirect_to nurse_list_path(params[:nurse_id])
	end

	def destroy
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]
			@nurse.delete_nurse(params[:selected_nurse])
		end
		redirect_to nurse_list_path(params[:nurse_id])
	end

	def edit
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]
			@selected_nurse = Nurse.find params[:selected_nurse]
		end
	end

	def update
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]
			@nurse.edit_nurse(params[:selected_nurse], params[:first_name], params[:last_name], params[:email], params[:mobile_phone], params[:home_phone])
		end
		redirect_to nurse_list_path(params[:nurse_id])
	end
	def nurse_list
		if is_logged_nurse?
			@nurse = Nurse.find params[:nurse_id]
			@doctors = @nurse.get_doctors
			@nurses = @nurse.get_nurses
		end
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

  	private

  	def is_logged_nurse?
  		session[:id].to_i == params[:nurse_id].to_i ? true : false
  	end
end