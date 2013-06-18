class Vendor < ActiveRecord::Base
   attr_accessible :ids, :name, :address, :zip, :score, :gunsign, :distance
   
     def import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Question.create! row.to_hash
    end
   end
   
end
