class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.float :latitude
      t.float :longitude
      t.string :type
      t.timestamps
    end
  end
end
