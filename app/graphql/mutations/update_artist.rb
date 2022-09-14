module Mutations
  class UpdateArtist < BaseMutation
    # TODO: define return fields
    # TODO: define arguments
    argument :email, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :id, ID, required: true
    type Types::ArtistType

    # TODO: define resolve method
    def resolve(id:, **attributes)
      Artist.find(id).tap do |artist|
        artist.update!(attributes)
      end
    end
  end
end
