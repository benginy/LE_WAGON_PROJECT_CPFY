class CreateLifeMoments < ActiveRecord::Migration[7.1]
  def change
    create_table :life_moments do |t|
      t.string :title
      t.string :image_url
      t.decimal :price_per_night
      t.string :description
      t.decimal :rating
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
