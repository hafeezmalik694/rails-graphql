module Mutations
  class CreateArtistMutation < BaseMutation
    field :artist, Types::ArtistType, null: false
    # field :errors, [String], null: false

    argument :email, String, required: true, description: 'The Email of Artist.'
    argument :firstName, String, required: true, description: 'FirstName of Artist.'
    argument :lastName, String, required: true, description: 'LastName of Artist.'

    def resolve(email:, firstName:, lastName:)
      artist = Artist.new(email: email, first_name: firstName, last_name: lastName)
      if artist.save
        {
          artist: artist,
          # errors: []
        }
      else
        execution_error(message: artist.errors.full_messages)
        # {
        #   artist: nil,
        #   errors: artist.errors.full_messages
        # }
      end
    end

  end
end