class CreateTableNurse < ActiveRecord::Migration
  def up
  	create_table :nurses do |n|
  		n.string		:first_name
  		n.string		:last_name
  		n.string		:email
  		n.string		:home_phone
  		n.string		:mobile_phone
  		n.integer		:nurse_role
  		n.string		:username
  		n.string		:hash_code
  	end
  end

  def down
  	drop_table :nurses
  end
end
