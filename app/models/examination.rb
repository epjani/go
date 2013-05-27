class Examination < ActiveRecord::Base
	attr_accessible :name, :description

	has_many :reservations
end