class Restaurant < ActiveRecord::Base
   attr_accessible :human_address, :score, :zip, :inspection_date, :name
   attr_accessible :city, :state, :recoding, :latitude, :longitude
end
