# frozen_string_literal: false

require 'dry-types'
require 'dry-struct'
require_relative 'store'

api_response = {
  place_id: 'ChIJnyawAAc2aDQRsweZWTh80d8',
  name: "WHO'S CAFE",
  formatted_address: '300台灣新竹市東區寶山路438號300',
  location_lat: 24.7847091,
  location_lng: 120.9901702,
  rating: 4.3,
  user_ratings_total: 52
}

store = PlaceInfo::Entity::Store.new(api_response)

puts store.place_id
