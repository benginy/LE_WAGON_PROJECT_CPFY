class AddDefaultStatusToLifeMoments < ActiveRecord::Migration[6.1]
  def change
    change_column_default :life_moments, :status, from: nil, to: 0
  end
end
