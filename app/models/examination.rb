class Examination < ActiveRecord::Base
	attr_accessible :name, :description

	has_many :reservations

	def self.pause
		Examination.where(:name => 'Pauza').first
	end

	def self.cito
		Examination.where(:name => 'CITO').first
	end

	def self.standard
		return 0
	end
end