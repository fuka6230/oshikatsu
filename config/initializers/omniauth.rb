Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
          Rails.application.credentials.google[:client_id],
          Rails.application.credentials.google[:client_secret]
  provider :twitter,
          Rails.application.credentials.twitter[:api_key],
          Rails.application.credentials.twitter[:api_secret]
end