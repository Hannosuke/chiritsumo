Rails.application.config.middleware.use OmniAuth::Builder do
  provider :esa,
           Rails.application.credentials.esa[:client_id],
           Rails.application.credentials.esa[:client_secret],
           scope: 'read'
end
