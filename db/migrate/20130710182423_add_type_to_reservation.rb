class AddTypeToReservation < ActiveRecord::Migration
  def up
  	add_column :reservations, :reservation_type, :integer, :default => 0
  end

  def down
  	remove_column :reservations, :reservation_type
  end
end
