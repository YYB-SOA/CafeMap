# frozen_string_literal: true

require 'yaml'
require 'http'

module CafeMap
  module Place
    # Library for Place API
    class PlaceApi
      def initialize(token_name, store_namearr)
        @token_name = token_name
        @store_namearr = store_namearr
      end

      def store()
        Request.new(@token_name, @store_namearr).request_main() # Array
      end

      # Sends out HTTP requests to Google Place API
      class Request
        def initialize(token_name, store_namearr )
          @token_name = token_name # @token_name ＝'Place_api'
          @store_namearr = store_namearr
        end

        def get_placeapi_token(name_of_key = @token_name)
          config_yaml = YAML.safe_load(File.read('config/secrets.yml'))
          config_yaml['GOOGLE_MAP'][0][name_of_key]
        end

        def call_placeapi_url(input, token)
          puts "call_placeapi_url: #{input}"
          puts "token is nil?: #{token.nil?}"

          http_response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{input}&key=#{token}&language=zh-TW")

          Response.new(http_response).tap do |response|
            raise(response.error) unless response.successful?
          end
        end

        def data_clean(box)
          # Input: string array of cafe name
          box.map { |name_str| name_str.gsub('()', '').gsub(' ', '').gsub("\b", '') }
        end

        def request_main(safty = 1)
          # Caution: We set "safty" for avoid overcharging from placeAPI: do not chage it for testing
          name_array =  @store_namearr[..safty]
          data_clean(name_array).each do |eachstore|
            puts "request_main: #{eachstore}"
            call_placeapi_url(eachstore, get_placeapi_token(@token_name)).parse
          end
        endgit 
      end

      # Decorates HTTP responses  with success/error reporting
      class Response < SimpleDelegator
        Unauthorized = Class.new(StandardError)
        NotFound = Class.new(StandardError)

        HTTP_ERROR = {
          401 => Unauthorized,
          404 => NotFound
        }.freeze

        def successful?
          HTTP_ERROR.keys.none?(code)
        end

        def error
          HTTP_ERROR[code]
        end
      end
    end
  end
end