class Nurse < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email, :home_phone, :mobile_phone, :nurse_role, :username, :hash_code
	ROLE_ADMIN 	= 0
	ROLE_MAIN	= 1
	ROLE_BASIC	= 2

	# => Create nurse (can only be invoked by Nurse::ROLE_ADMIN)
	def create_nurse(first_name, last_name, email, mobile_phone, home_phone, username, password)
		if(self.role == ROLE_ADMIN)
			hashed_pass = Digest::SHA256.hexdigest(password)
			Nurse.create({:first_name => first_name, :last_name => last_name, :email => email, :home_phone => home_phone, :mobile_phone => mobile_phone, :nurse_role => role, :username => username, :hash_code => hashed_pass})
		end
	end

	def self.create_admin_nurse()
		Nurse.create({:first_name => 'Admin', :last_name => 'Nurse', :email => 'pjanicedin87@gmail.com', :home_phone => '111111', :mobile_phone => '111111', :nurse_role => ROLE_ADMIN, :username => 'admin', :hash_code => Digest::SHA256.hexdigest('ginekologija')})
	end
end