module Mutations
  class DestroyArtist < BaseMutation
    argument :id, ID, required: true
    type Types::ArtistType

    def resolve(id:)
      Artist.find(id).destroy
    end

  end
end