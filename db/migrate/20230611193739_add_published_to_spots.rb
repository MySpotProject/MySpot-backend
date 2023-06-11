class AddPublishedToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :published, :boolean
  end
end
