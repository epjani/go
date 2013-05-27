class Doctor < ActiveRecord::Base
	attr_accessible :first_name, :last_name

	has_many :reservations

	def full_name
		return "#{self.first_name} #{self.last_name}"
	end
end