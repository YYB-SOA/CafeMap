# frozen_string_literal: true

require 'simplecov'
# SimpleCov.start

require 'yaml'

require 'minitest/autorun'
require 'minitest/rg'
require 'vcr'
require 'webmock'

require_relative '../../lib/gateways/cafe_api.rb'
CONFIG = YAML.safe_load(File.read('config/secrets.yml'))

CAFE_TOKEN = 'Cafe_api' # CONFIG['CAFE_NOMAD'][0]['Cafe_api']
CORRECT = YAML.safe_load(File.read('spec/fixtures/cafe_nomad3.yml'))
FAKE_TOKEN = 'Fake_api'

CASSETTES_FOLDER = 'spec/fixtures/cassettes'
CASSETTE_FILE = 'cafe_api'

def ans_sheet(target_attr, data_keys)
    data_keys.map do |item|
        CORRECT[item][target_attr]
    end
end