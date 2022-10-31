# frozen_string_literal: true

require_relative 'place_api_spec_helper'

describe 'Tests Place API library' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock
    c.filter_sensitive_data('<Place_TOKEN>') { PLACE_TOKEN }
    c.filter_sensitive_data('<Place_TOKEN_ESC>') { CGI.escape(PLACE_TOKEN) }
  end

  before do
    VCR.insert_cassette CASSETTE_FILE,
                        record: :new_episodes,
                        match_requests_on: %i[method uri headers]
  end

  after do
    VCR.eject_cassette
  end

  describe 'Store information' do

    before do
      test_store = ["陶匠咖啡", '過日子咖啡館']
      @store = CafeMap::Place::StoreMapper.new(TOKEN_NAME, test_store).load_several
      @yaml_keys = CORRECT.keys[0..].each{|key| CORRECT[key]['results']}

      @cafe_info = CafeMap::CafeNomad:: InfoMapper.new('Cafe_api').load_several
      @yaml_keys = CORRECT.keys[3..]
    end
# @yaml_keys.map { |item| CORRECT[item]['id'] }

    it 'HAPPY: should provide correct Store attributes' do
      _( @store.place_id.must_equal ans_sheet('place_id', @yaml_keys)
      # _( @store.place_id.must_equal @yaml_keys.each{|item|item.each{|i| i['place_id']} })
      _( @store.business_status.must_equal @yaml_keys.map{|item|item.map{|i| i['business_status']} }[0][0])
      _( @store.location_lat.must_equal @yaml_keys.map{|item|item.map{|i| i['geometry']['location']['lat']} }[0][0])
      _( @store.location_lng.must_equal @yaml_keys.map{|item|item.map{|i| i['geometry']['location']['lng']} }[0][0])

    end
  end
end




# it 'HAPPY: should provide correct Shop attributes' do
#   # PlaceApi會繼承module Store class 的特定參數，目前store檔案只有傳入store_yaml，可能不適合
#   store = PlaceInfo::PlaceApi.new(KEYWORD_FILTER, TOKEN_NAME).store(KEYWORD_FILTER,TOKEN_NAME)
#   array_hash = CORRECT_STORE[0..].map{|key| CORRECT[key]['results']}

#   _(store.place_id.must_equal array_hash.map{|item|item.map{|i| i['place_id']} }[0][0])
#   _(store.business_status.must_equal array_hash.map{|item|item.map{|i| i['business_status']} }[0][0])
#   # Location 在不同層
#   _(store.location_lat.must_equal array_hash.map{|item|item.map{|i| i['geometry']['location']['lat']} }[0][0])
#   _(store.location_lng.must_equal array_hash.map{|item|item.map{|i| i['geometry']['location']['lng']} }[0][0])

# end