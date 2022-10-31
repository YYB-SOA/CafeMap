require_relative "../mappers/store_mapper.rb"
# require_relative '../../spec/place_api_spec_helper.rb'
require 'yaml'
require 'http'


# aa = ["陶匠咖啡", '過日子咖啡館']
# aa.each{ |i| puts i.class}
# def get_placeapi_token(name_of_key = @token_name)
#   config_yaml = YAML.safe_load(File.read('config/secrets.yml'))
#   config_yaml['GOOGLE_MAP'][0][name_of_key]
# end

# puts get_placeapi_token('Place_api')
raw =  CafeMap::Place::PlaceApi.new("Place_api", ["陶匠咖啡", '過日子咖啡館'])
entity =  raw.store()
puts entity.class



# puts raw.store
# puts ["陶匠咖啡", '過日子咖啡館'] [..10].class
# temp = ["a" ,"b", "n", "f", "d"  ,"ff" ,"ff", "AFS" ,"FASA" ,"FSAFA"]
# puts temp.class
# saft = true
# name_array = temp[..10] if saft == true
# puts name_array

# def call_placeapi_url(input, token)
#     http_response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{input}&key=#{token}&language=zh-TW")

#     # Response.new(http_response).tap do |response|
#     #   raise(response.error) unless response.successful?
#     # end
#   end

# puts call_placeapi_url("陶匠咖啡","AIzaSyDn1SNO-unHl8mSu2u3ZQ7dzfab4Y5bOZ0")