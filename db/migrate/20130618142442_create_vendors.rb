class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :score
      t.integer :zip
      t.string :gunsign
      t.float :distance
      t.boolean :permitvalid
      t.boolean :hasvalid
      
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
