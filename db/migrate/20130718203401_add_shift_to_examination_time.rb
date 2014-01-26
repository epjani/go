class AddShiftToExaminationTime < ActiveRecord::Migration
  def up
  	add_column :examination_times, :shift, :integer
  end

  def down
  	remove_column :examination_times, :shift
  end
end
