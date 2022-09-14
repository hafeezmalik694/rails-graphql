module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :items, [Types::ItemType], null: false,
          description: "Return a list of items"
    field :artists, [Types::ArtistType], null: false,
          description: "Return a list of Artists"
    field :me, Types::ArtistType, null: false,
          description: "Return Current User"
    def items
      Item.preload(:artist)
    end

    field :find_item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end

    def find_item(id:)
      Item.find_by_id(id)
    end

    def me
      Artist.first
    end

    def artists
      Artist.all
    end

  end
end
