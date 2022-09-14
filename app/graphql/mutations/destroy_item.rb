module Mutations
  class DestroyItem < BaseMutation
    argument :id, ID, required: true
    type Types::ItemType

    def resolve(id:)
      Item.find(id).destroy
    end

  end
end