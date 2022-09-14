module Mutations
  class CreateItemMutation < BaseMutation
    # TODO: define return fields
    field :item, Types::ItemType, null: false
    field :errors, [String], null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :description, String, required: true
    argument :artist_id, Integer, required: true
    argument :image_url, String, required: false

    # TODO: define resolve method
    def resolve(**attributes)
      item = Item.new(attributes)
      if item.save
        {item: item, errors: []}
      else
        {item: nil, errors: item.errors.full_messages}
      end
    end
  end
end
