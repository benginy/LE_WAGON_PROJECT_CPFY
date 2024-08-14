class AddStatusToLifeMoments < ActiveRecord::Migration[7.1]
  def change
    add_column :life_moments, :status, :string
  end
end
