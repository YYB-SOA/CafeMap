require_relative 'place_api_spec_helper'


gg = PlaceInfo::PlaceApi.new(KEYWORD_FILTER, TOKEN_NAME).store(KEYWORD_FILTER,TOKEN_NAME)
gg