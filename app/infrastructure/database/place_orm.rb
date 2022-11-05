# frozen_string_literal: true

require 'sequel'


module CafeMap
  module Database
    # Object-Relational Mapper for Members
    class PlaceOrm < Sequel::Model(:store)
      # one_to_one :info,
      #            class: :'CafeMap::Database::InfoOrm'

      #   many_to_many :contributed_projects,
      #                class: :'CafeMap::Database::StoreOrm',
      #                join_table: :projects_members,
      #                left_key: :member_id, right_key: :project_id

      plugin :timestamps, update_on_create: true

      # def self.find_or_create(place_info)
      #   first(storename: place_info[:storename]) || create(place_info)
      # end
    end
  end
end
