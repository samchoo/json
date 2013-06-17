class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    require 'open-uri'
    require 'json'
    url = "http://data.austintexas.gov/resource/ecmv-9xxi.json?" + "$offset=1001"
    @result = JSON.parse(open(url).read) 
    @result.each do |single|
      @restaurant=Restaurant.new
      single.each  do |a , b|
        if a == "inspection_date"
          @inspection_date=b
        end
        if  a== "zip_code"
          @zip=b
          
        end
        if a== "address"
          b.each do |key, val| 
           if key =="needs_recoding"
               @recoding= val
               
                end
           if key == "longitude"
               @longitude = val
                  
           end  
          if key == "latitude" 
                @latitude= val
                 
              end  
          if key =="human_address"
             address_split=val.split(',')
                address_split.each do |values| 
                    address_core=values.split(":") 
                    if address_core[0]== '{"address"'
                        @human_address= address_core[1].to_s.delete('"')
                       
                       end
                    if address_core[0]== '"city"' 
                        @city= address_core[1].to_s.delete('"')
                         
                       end 
                      if address_core[0]== '"state"' 
                        @state= address_core[1].to_s.delete('"') 
                         
                      end  
                    end 
                end 
               end 
            end 
          end
          
         end
        @restaurant.save 
       end
  end 
 
 
