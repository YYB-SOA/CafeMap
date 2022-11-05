# frozen_string_literal: true

require 'sequel'
require './config/environment'

# def require_app(folders = %w[infrastructure models views controllers])
#   app_list = Array(folders).map { |folder| "app/#{folder}" }
#   full_list = ['config', app_list].flatten.join(',')

#   Dir.glob("./{#{full_list}}/**/*.rb").each do |file|
#     require file
#   end
# end


module CafeMap
  module Database
    # Object Relational Mapper for Project Entities
    class InfoOrm < Sequel::Model(:info)
      # one_to_one :store,
      #             class: :'CodePraise::Database::PlaceOrm',
      #             key: :id

      plugin :timestamps, update_on_create: true
    end
  end
end


# require_app
a = CafeMap::Database::InfoOrm.create()
a.name = '123'
a.save
puts CafeMap::Database::InfoOrm.all