# spec/support/auth_helper.rb

module AuthHelper
    def sign_in_as(user)
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: user.provider,
        uid: user.uid,
        info: {
          name: user.name,
          image: user.image_url
        }
      })
      get "/auth/github/callback"
    end
end
  