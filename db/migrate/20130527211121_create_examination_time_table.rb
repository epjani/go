class CreateExaminationTimeTable < ActiveRecord::Migration
  def up
  	create_table :examination_times do |et|
  		et.string		:examination_time
  	end
  end

  def down
  	drop_table :examination_times
  end
end
