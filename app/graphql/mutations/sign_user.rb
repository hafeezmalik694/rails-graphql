module Mutations
  class SignUser < BaseMutation
    null true

    # argument :credentials, Types::AuthProviderCredentialsInput, required: false
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil, password: nil)
      # basic validation
      user = User.find_by email: email

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(password)

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      # token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      # { user: user, token: token }
      token = AuthToken.token(user)
      {user: user, token: token}
    end
  end
end