# frozen_string_literal: true

require_relative 'cafe_api_spec_helper'

describe 'Tests Cafe Nomad API library' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock
    c.ignore_localhost = true
    c.filter_sensitive_data('<CAFE_TOKEN>') { CAFE_TOKEN }
    c.filter_sensitive_data('<CAFE_TOKEN_ESC>') { CGI.escape(CAFE_TOKEN) }
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
    it 'HAPPY: should provide correct api status attributes' do
      api_status = CafeNomad::CafeApi.new('CAFE_NOMAD', CAFE_TOKEN).api_status
      _(api_status.status).must_equal CORRECT['status']
      _(api_status.amount).must_equal CORRECT['amount']
      _(api_status.header).must_equal CORRECT['header']
    end
  end
  describe 'cafe nomad  information' do
    before do
      @api_info = CafeNomad::CafeApi.new('CAFE_NOMAD', CAFE_TOKEN).api_info
      @cafe_yaml_keys = CORRECT.keys[3..]
    end
    #--------------------------review/feedback-----------

    it 'HAPPY: should pass corect ID' do
      _(@api_info.map(&:id)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['id'] }
    end
    it 'HAPPY: should pass corect name' do
      _(@api_info.map(&:name)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['name'] }
    end
    it 'HAPPY: should pass corect city' do
      _(@api_info.map(&:city)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['city'] }
    end
    it 'HAPPY: should pass corect wifi score' do
      _(@api_info.map(&:wifi)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['wifi'] }
    end
    it 'HAPPY: should pass corect seat score' do
      _(@api_info.map(&:seat)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['seat'] }
    end
    it 'HAPPY: should pass corect quiet score' do
      _(@api_info.map(&:quiet)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['quiet'] }
    end
    it 'HAPPY: should pass corect tasty score' do
      _(@api_info.map(&:tasty)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['tasty'] }
    end
    it 'HAPPY: should pass corect cheap score' do
      _(@api_info.map(&:cheap)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['cheap'] }
    end
    it 'HAPPY: should pass corect music score' do
      _(@api_info.map(&:music)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['music'] }
    end
    it 'HAPPY: should pass corect url' do
      _(@api_info.map(&:url)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['url'] }
    end
    it 'HAPPY: should pass corect address' do
      _(@api_info.map(&:address)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['address'] }
    end
    it 'HAPPY: should pass corect latitude' do
      _(@api_info.map(&:latitude)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['latitude'] }
    end
    it 'HAPPY: should pass corect longitude' do
      _(@api_info.map(&:longitude)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['longitude'] }
    end
    it 'HAPPY: should pass corect limited_time' do
      _(@api_info.map(&:limited_time)).must_equal @cafe_yaml_keys.map { |item|
                                                    CORRECT[item]['limited_time']
                                                  }
    end
    it 'HAPPY: should pass identitied socket' do
      _(@api_info.map(&:socket)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['socket'] }
    end
    it 'HAPPY: should pass identitied standing_desk' do
      _(@api_info.map(&:standing_desk)).must_equal @cafe_yaml_keys.map { |item|
                                                     CORRECT[item]['standing_desk']
                                                   }
    end
    it 'HAPPY: should pass corrected  mrt' do
      _(@api_info.map(&:mrt)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['mrt'] }
    end
    it 'HAPPY: should pass corrected  open_time' do
      _(@api_info.map(&:open_time)).must_equal @cafe_yaml_keys.map { |item| CORRECT[item]['open_time'] }
    end
  end
end
