# frozen_string_literal: true

require 'http'
require 'yaml'
require 'httparty'
require 'json'
require 'net/http'
require 'uri'

config = YAML.safe_load(File.read('config/secrets.yml'))

def news_api_path(path)
  "https://newsapi.org/v2/top-headlines?country=tw&apiKey=#{path}"
end
key = config['api'][0]['News']
full_url = news_api_path(key)

def call_news_url(url)
  full = URI(url)
  res = Net::HTTP.get_response(full)
  res.body if res.is_a?(Net::HTTPSuccess)
end

news_json = call_news_url(full_url)

# print news_json
def hash_to_json(data, dist)
  # Save it!
  f_data = File.open(dist, 'w')
  f_data.write(data)
  f_data.close
end

hash_to_json(news_json, 'lib/sample/news.json')
