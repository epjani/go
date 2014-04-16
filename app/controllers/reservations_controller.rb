class ReservationsController <  ApplicationController
	disable_layout_for_ajax

	def index
		@doctors = @nurse.get_doctors
	end

	def new
		@doctors = @nurse.get_doctors
		@examinations = @nurse.get_examinations
		
		@reservation_date = Date.parse(params[:selected_date])
		@doctor_id = params[:doctor_id].blank? ? @doctors.first.id : params[:doctor_id]
		@examination_times = @nurse.get_examination_times(params[:selected_date], @doctor_id, params[:shift])
		@examination_time = params[:examination_time].blank? ? nil : params[:examination_time]
		# => if pause
		@type = params[:type].blank? ? Examination.standard : params[:type].to_i
		@examination = Examination.pause
		puts "params[:type] : #{params[:type]}"
		puts "@type : #{@type}"
		puts "Examination.pause : #{Examination.pause}"
	end

	def create
		reservation_type = params[:type].blank? ? nil : params[:type]
		reservation_passed = @nurse.create_reservation(params[:first_name], params[:last_name], params[:phone], params[:birthday], params[:doctor_id], params[:examination_id], params[:examination_time_id], params[:reservation_date], reservation_type)
		flash[:alert] = 'Prethodna rezervacija nije bila upisana jer vec postoji rezervacija za taj termin!' unless reservation_passed
		redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id], :selected_date => params[:reservation_date], :shift => params[:shift]})
	end

	def destroy
		@nurse.delete_reservation(params[:id])
		#redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id], :shift => params[:shift], :doctor_id => params[:doctor_id], :selected_date => params[:reservation_date]})
	    redirect_to(:back)
	end

	def edit
		@doctors = @nurse.get_doctors
		@examination_times = @nurse.get_examination_times(params[:selected_date], nil, params[:shift])
		@examinations = @nurse.get_examinations
		@reservation = Reservation.find(params[:id])
	end

	def update
		@nurse.edit_reservation(params[:id], params[:first_name], params[:last_name], params[:phone], params[:birthday], params[:doctor_id], params[:examination_id], params[:examination_time_id], params[:reservation_date], params[:type])
		redirect_to nurse_dashboard_path(@nurse.id, {:doctor_id => params[:doctor_id], :shift => params[:shift], :selected_date => params[:reservation_date]})
	end

end