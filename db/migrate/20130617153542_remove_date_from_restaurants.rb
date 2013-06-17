class RemoveDateFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :inspection_date
  end

 
end
