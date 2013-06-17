class AddDateFromRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :inspection_date, :date
  end
end
