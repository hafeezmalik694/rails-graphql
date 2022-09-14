module Mutations
    class UpdateItem < ::Mutations::BaseMutation
      argument :id, Integer, required: true
      argument :title, String, required: false
      argument :description, String, required: false
      argument :artist_id, Integer, required: false

      type Types::ItemType

      def resolve(id:, **attributes)
        Book.find(id).tap do |book|
          book.update!(attributes)
        end
      end
    end
  end