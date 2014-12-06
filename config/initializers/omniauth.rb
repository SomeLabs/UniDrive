Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :dropbox_oauth2, ENV['DROPBOX_KEY'], ENV['DROPBOX_SECRET']
  provider :windowslive, ENV['WINDOWSLIVE_CLIENT_ID'], ENV['WINDOWSLIVE_SECRET'], :scope => 'wl.emails, wl.basic'
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
