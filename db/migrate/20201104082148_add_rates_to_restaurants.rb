class AddRatesToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :webpage,      :string
    add_column :restaurants, :parking,      :string
    add_column :restaurants, :others,       :text
    add_column :restaurants, :taste_rate,   :float
    add_column :restaurants, :price_rate,   :float
    add_column :restaurants, :service_rate, :float
  end
end
