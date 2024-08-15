class ChangeStatusTypeInLifeMoments < ActiveRecord::Migration[7.1]
  def up
    # Change the status column from string to integer
    change_column :life_moments, :status, :integer, using: 'status::integer', default: 0
  end
end
