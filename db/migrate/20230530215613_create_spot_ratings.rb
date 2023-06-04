class CreateSpotRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :spot_ratings do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
