class CreateUserRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.string :reason

      t.timestamps
    end
  end
end
