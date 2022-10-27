require 'http'

# 測試：call API test
# input = "WHO'S喜象CAFE"
# token = "AIzaSyDn1SNO-unHl8mSu2u3ZQ7dzfab4Y5bOZ0"
# puts HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{input}&key=#{token}&language=zh-TW")


response = JSON.parse(File.read('app/mappers/test.json'))
# puts "place_id : #{response['results'][0]['place_id']}"
# puts "name : #{response['results'][0]['name']}"
# puts "address : #{response['results'][0]['formatted_address']}"
# puts "rating : #{response['results'][0]['rating']}"
# puts "user_ratings_total : #{response['results'][0]['user_ratings_total']}"

# puts "location_lat: #{response['results'][0]['geometry']['location']['lat']}"
# puts "location_lng: #{response['results'][0]['geometry']['location']['lng']}"

