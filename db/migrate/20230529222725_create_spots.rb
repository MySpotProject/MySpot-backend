class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :lng
      t.float :lat
      t.boolean :pools
      t.boolean :ramps
      t.boolean :rail
      t.boolean :ladder
      t.boolean :slide

      t.timestamps
    end
  end
end
