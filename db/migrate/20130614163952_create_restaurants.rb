class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :human_address
      t.integer :score
      t.integer :zip
      t.string :inspection_date
      
      t.string :name
      t.string :city
      t.string :state
      t.boolean :recoding
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
