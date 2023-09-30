Rails.application.config.middleware.use OmniAuth::Builder do
  provider :esa, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"], scope: 'read'
end
