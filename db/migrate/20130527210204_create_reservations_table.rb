class CreateReservationsTable < ActiveRecord::Migration
def up
  	create_table :reservations do |r|
  		r.string		:first_name
  		r.string		:last_name
  		r.string		:birthday
  		r.string		:phone
  		r.references	:doctor
  		r.references	:nurse
  		r.references	:examination
  		r.references	:examination_time
  		r.timestamps
  	end
  end

  def down
  	drop_table :reservations
  end
end
