class CreateRestaurantTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_tag_relations do |t|
      t.references :restaurant, foreign_key: true
      t.references :tag,        foreign_key: true
      t.timestamps
    end
    add_index :restaurant_tag_relations, [:restaurant_id, :tag_id], unique: true
  end
end
