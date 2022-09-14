module Mutations
  class CreateUser < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    # class AuthProviderSignupData < Types::BaseInputObject
    #   argument :credentials, Types::AuthProviderCredentialsInput, required: false
    # end

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    # argument :auth_provider, AuthProviderSignupData, required: false

    # type Types::UserType
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    def resolve(name:, email:, password: )
      user = User.new(name: name, email: email, password: password)
      if user.save
        {user: user, errors: []}
      else
        {user: nil, errors: user}
      end
    end
  end
end