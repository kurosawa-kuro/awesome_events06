Rails.application.config.middleware.use OmniAuth::Builder do
    OmniAuth.config.allowed_request_methods = [:get, :post]
    if Rails.env.development? || Rails.env.test?
      provider :github, "2e122e66d4597660c5d4", "09bfba470d48627b9f983d91b85c845567fe583c"
    else
      provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:client_secret]
    end
end