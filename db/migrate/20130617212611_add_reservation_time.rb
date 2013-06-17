class AddReservationTime < ActiveRecord::Migration
  def up
  	add_column :reservations, :reservation_date, :date
  end

  def down
  	remove_column :reservations, :reservation_date
  end
end
