class CreateDoctors < ActiveRecord::Migration
  def up
  	create_table :doctors do |d|
  		d.string		:first_name
  		d.string		:last_name
  	end
  end

  def down
  	drop_table :doctors
  end
end
