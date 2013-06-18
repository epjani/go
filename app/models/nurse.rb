class Nurse < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email, :home_phone, :mobile_phone, :nurse_role, :username, :hash_code
	ROLE_ADMIN 	= 0 # => Administrator
	ROLE_MAIN	= 1 # => Glavna medicinska sestra
	ROLE_BASIC	= 2	# => Medicinska sestra

	has_many :reservations

	# => Create nurse (can only be invoked by Nurse::ROLE_ADMIN || Nurse::ROLE_MAIN)
	def create_nurse(first_name, last_name, email, mobile_phone, home_phone, username, password, role)
		if(self.is_admin? || self.is_main?)
			hashed_pass = Digest::SHA256.hexdigest(password)
			Nurse.create({:first_name => first_name, :last_name => last_name, :email => email, :home_phone => home_phone, :mobile_phone => mobile_phone, :nurse_role => role, :username => username, :hash_code => hashed_pass})
		end
	end

	def self.create_admin_nurse()
		Nurse.create({:first_name => 'Admin', :last_name => 'Nurse', :email => 'pjanicedin87@gmail.com', :home_phone => '111111', :mobile_phone => '111111', :nurse_role => ROLE_ADMIN, :username => 'admin', :hash_code => Digest::SHA256.hexdigest('ginekologija')})
	end

	# => Nurse checkers
	def is_admin?
		self.nurse_role == ROLE_ADMIN
	end

	def is_main?
		self.nurse_role == ROLE_MAIN
	end

	def is_basic?
		self.nurse_role == ROLE_BASIC
	end

	# => Doctor
	def create_doctor(first_name, last_name)
		if self.is_admin? || self.is_main?
			doctor = Doctor.new
			doctor.first_name 	= first_name
			doctor.last_name	= last_name
			doctor.save
		end
	end

	def get_doctors
		Doctor.all
	end

	def delete_doctor(doctor_id)
		Doctor.delete doctor_id if self.is_admin? || self.is_main?
	end

	# => Examination
	def create_examination(name, description)
		if self.is_main? || self.is_admin?
			examination = Examination.new
			examination.name = name
			examination.description = description
			examination.save
		end
	end

	def delete_examination(id)
		Examination.delete id if self.is_main? || self.is_admin?
	end

	def get_examinations
		Examination.all
	end

	# => Reservation

	def get_reservations(selected_date = nil, doctor_id = nil)
		if selected_date.blank? || doctor_id.blank?
			reservations = Reservation.all
		else
			reservations = Reservation.where({:doctor_id => doctor_id, :reservation_date => selected_date})
		end
		get_structured_reservations(reservations)
	end

	def get_structured_reservations(reservations)
		examination_times = ExaminationTime.all

		structed_reservations = []

		examination_times.each do |et|
			structed_reservations << {:examination_time => et}
			reservations.each do |r|
				if r.examination_time_id == et.id
					structed_reservations.last.merge!({:reservation => r})
				end
			end
		end
				
		return structed_reservations
	end
	def create_reservation(first_name, last_name, phone, birthday, doctor_id, examination_id, examination_time_id, reservation_date)
		if self.is_admin? || self.is_main?
			reservation = Reservation.new
			manipulate_reservation(reservation, first_name, last_name, phone, birthday, doctor_id, examination_id, examination_time_id, reservation_date)
		end
	end

	def edit_reservation(id, first_name, last_name, phone, birthday, doctor_id, examination_id, examination_time_id, reservation_date)
		if self.is_admin? || self.is_main?
			reservation = Reservation.find(id)
			manipulate_reservation(reservation, first_name, last_name, phone, birthday, doctor_id, examination_id, examination_time_id, reservation_date)
		end
	end

	def delete_reservation(reservation_id)
		Reservation.delete reservation_id if self.is_admin? || self.is_main?
	end
	
	def manipulate_reservation(reservation, first_name, last_name, phone, birthday, doctor_id, examination_id, examination_time_id, reservation_date)
		reservation.first_name = first_name
		reservation.last_name = last_name
		reservation.phone = phone
		reservation.birthday = birthday
		reservation.doctor_id = doctor_id
		reservation.examination_id = examination_id
		reservation.examination_time_id = examination_time_id
		reservation.nurse_id = self.id
		reservation.reservation_date = reservation_date.to_date
		reservation.save
	end
	# => ExaminationTime
	def get_examination_times
		ExaminationTime.all
	end
end