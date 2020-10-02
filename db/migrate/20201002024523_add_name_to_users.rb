class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name,        :string, null: false
    add_column :users, :name_kana,   :string, null: false
    add_column :users, :employee_id, :string, null: false
  end
end
