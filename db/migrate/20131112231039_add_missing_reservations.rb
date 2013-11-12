class AddMissingReservations < ActiveRecord::Migration
  def up
  	ExaminationTime.create({:examination_time => "14:00-14:15", :shift => 1})
  	ExaminationTime.create({:examination_time => "19:00-19:15", :shift => 2})
  end

  def down
  end
end
