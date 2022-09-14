module Types
  class MutationType < Types::BaseObject
    field :create_artist_mutation, mutation: Mutations::CreateArtistMutation
    field :update_artist, mutation: Mutations::UpdateArtist
    field :create_item_mutation, mutation: Mutations::CreateItemMutation
    field :update_item, mutation: Mutations::UpdateItem
    field :destroy_item, mutation: Mutations::DestroyItem
    field :create_user, mutation: Mutations::CreateUser
    field :sign_user, mutation: Mutations::SignUser
    field :destroy_artist, mutation: Mutations::DestroyArtist
  end
end
