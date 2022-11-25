# frozen_string_literal: true

require 'figaro'
require 'roda'
require 'sequel'
require 'yaml'
require 'rack/session'
require 'logger'

module CafeMap
  # Configuration for the App
  class App < Roda
    plugin :environments

    # rubocop:disable Lint/ConstantDefinitionInBlock
    configure do
      # Environment variables setup
      Figaro.application = Figaro::Application.new(
        environment:,
        path: File.expand_path('config/secrets.yml')
      )
      Figaro.load
      def self.config = Figaro.env

      use Rack::Session::Cookie, secret: config.SESSION_SECRET

      configure :development, :test do
        require 'pry'; # for breakpoints
        ENV['DATABASE_URL'] = "sqlite://#{config.DB_FILENAME}"
      end

      # Database Setup
      DB = Sequel.connect(ENV.fetch('DATABASE_URL'))
      def self.DB = DB # rubocop:disable Naming/MethodName

      # Logger Setup
      LOGGER = Logger.new($stderr)
      def self.logger = LOGGER
    end
  end
end
