# frozen_string_literal: true

module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :items, [Types::ItemType], null: false
    field :full_name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items_count, String, null: false

    def full_name
      [object.first_name, object.last_name].compact.join(" ")
    end

    def items_count
      object.items.count
    end
  end
end
