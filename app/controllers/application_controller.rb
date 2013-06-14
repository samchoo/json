class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    require 'open-uri'
    require 'json'
    url = "http://data.austintexas.gov/resource/ecmv-9xxi.json?" + "$offset=1001"

@result = JSON.parse(open(url).read)
  end
  
end
