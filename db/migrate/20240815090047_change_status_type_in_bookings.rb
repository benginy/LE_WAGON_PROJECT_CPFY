class ChangeStatusTypeInBookings < ActiveRecord::Migration[7.1]
  def up
    # Change the status column from string to integer
    change_column :bookings, :status, :integer, using: 'status::integer', default: 0
  end
end
