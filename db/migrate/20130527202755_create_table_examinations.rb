class CreateTableExaminations < ActiveRecord::Migration
  def up
  	create_table :examinations do |d|
  		d.string		:name
  		d.string		:description
  	end
  end

  def down
  	drop_table :examinations
  end
end
