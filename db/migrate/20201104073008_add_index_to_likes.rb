class AddIndexToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, [:user_id, :restaurant_id], unique: true
  end
end
