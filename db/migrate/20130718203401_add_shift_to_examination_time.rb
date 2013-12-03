class AddShiftToExaminationTime < ActiveRecord::Migration
  def up
  	add_column :examination_times, :shift, :integer
  	add_column :examination_times, :et_index, :integer
  end

  def down
  	remove_column :examination_times, :shift
  	remove_column :examination_times, :et_index
  end
end
