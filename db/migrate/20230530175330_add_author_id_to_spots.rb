class AddAuthorIdToSpots < ActiveRecord::Migration[7.0]
  def change
    add_reference :spots, :author, foreign_key: { to_table: :users }
  end
end
