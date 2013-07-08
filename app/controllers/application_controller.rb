class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    require 'open-uri'
    require 'json'
    url = "http://data.austintexas.gov/resource/ecmv-9xxi.json?" + "$offset=1001"
    result = JSON.parse(open(url).read) 
 
  

    result.each do |single|
    restaurant=Restaurant.new
      single.each do |a , b|
        if a == "inspection_date"
          restaurant.inspection_date = Time.at(b.to_i)
        end
        if  a == "zip_code"
          restaurant.zip = b
          
        end
        if a == "restaurant_name"
          restaurant.name = b
          
        end
        if a == "score"
          restaurant.score=b
        end
        if a == "address"
          b.each do |key, val| 
           if key == "needs_recoding"
               restaurant.recoding= val
                end
           if key == "longitude"
               restaurant.longitude = val
           end  
          if key == "latitude" 
                restaurant.latitude= val
              end  
          if key =="human_address"
             address_split=val.split(',')
 
                address_split.each do |address_val| 
                    address_total = address_val.split(":") 
                    if address_total[0] == '{"address"'
                        restaurant.human_address= address_total[1].to_s.delete('"')
                       
                       end
                    if address_total[0] == '"city"' 
                        restaurant.city = address_total[1].to_s.delete('"')
                         
                       end 
                      if address_total[0] == '"state"' 
                        restaurant.state = address_total[1].to_s.delete('"') 
                         
                      end  #end if
                    end 
                end 
               end 
            end 
          end
        restaurant.save   
         end
   
       end
       def home
         
       end
       def add
        
         @restaurant=Restaurant.new
         currentaddress=  params[:human_address]
         currentdate= params[:inspection_date]
         @olddate= Restaurant.where("human_address = ? AND inspection_date = ?",params[:human_address],params[:inspection_date])
         if @olddate == nil
           
             
         else 
           @restaurant.save
            
         end
          
         
        
         
         
       end
       def all
         @restaurants=Restaurant.all
       end

  end 
 
 
