class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string      :name,            null: false
      t.text        :description,     null: false
      t.integer     :genre_id,        null: false
      t.integer     :ambiance_id,     null: false
      t.integer     :price_id,        null: false
      t.string      :tel,             null: false
      t.string      :address,         null: false
      t.string      :opening_hour,    null: false
      t.string      :closed,          null: false
      t.references  :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
