class CreateTricks < ActiveRecord::Migration[7.0]
  def change
    create_table :tricks do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.integer :difficulty

      t.timestamps
    end
  end
end
