class AddIndexes < ActiveRecord::Migration
  def change
    add_index :cities, :country_id
    add_index :phones, :city_id
  end
end
