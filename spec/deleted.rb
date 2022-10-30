require_relative 'cafe_api_spec_helper'

@yaml_keys = CORRECT.keys[3..]
# gg = PlaceInfo::PlaceApi.new(KEYWORD_FILTER, TOKEN_NAME).store(KEYWORD_FILTER,TOKEN_NAME)
puts ans_sheet('id', @yaml_keys).class

entity = CafeMap::CafeNomad:: InfoMapper.new('Cafe_api').load_several

# # entity.select {|store| puts store.id}
# puts "id NotPassed " if entity.map(&:id) != ans_sheet('id', @yaml_keys)
# puts "name NotPassed " if entity.map(&:name) != ans_sheet('name', @yaml_keys)
# puts "city NotPassed " if entity.map(&:city) != ans_sheet('city', @yaml_keys)
# puts "url NotPassed " if entity.map(&:url) != ans_sheet('url', @yaml_keys)
# puts "address NotPassed " if entity.map(&:address) != ans_sheet('address', @yaml_keys)
# puts "latitude NotPassed " if entity.map(&:latitude) != ans_sheet('latitude', @yaml_keys)
# puts "longitude NotPassed " if entity.map(&:longitude) != ans_sheet('longitude', @yaml_keys)
# puts "limited_time NotPassed " if entity.map(&:limited_time) != ans_sheet('limited_time', @yaml_keys)
# puts "mrt NotPassed " if entity.map(&:mrt) != ans_sheet('mrt', @yaml_keys) 


# ##########################
puts "music NotPassed " if entity.map(&:music) != ans_sheet('music', @yaml_keys).map(& :to_s)
puts "cheap NotPassed " if entity.map(&:cheap) != ans_sheet('cheap', @yaml_keys).map(& :to_s)
puts "tasty NotPassed " if entity.map(&:tasty) != ans_sheet('tasty', @yaml_keys).map(& :to_s)
puts "quiet NotPassed " if entity.map(&:quiet) != ans_sheet('quiet', @yaml_keys).map(& :to_s)
puts "seat NotPassed " if entity.map(&:seat) != ans_sheet('seat', @yaml_keys).map(& :to_s)
puts "wifi NotPassed " if entity.map(&:wifi) != ans_sheet('wifi', @yaml_keys).map(& :to_s)

# p ans_sheet('music', @yaml_keys).calss
# p entity.map(&:music)