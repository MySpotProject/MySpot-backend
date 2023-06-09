class AddLinksToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vk, :string
    add_column :users, :tg, :string
    add_column :users, :mail, :string
  end
end
