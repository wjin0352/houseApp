# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow"
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end

# You can now access the OmniAuth Google OAuth2 URL: /auth/google_oauth2