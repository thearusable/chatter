OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '479964785231-iavd3hpnanojh7n10h57na6qdgq39p5h.apps.googleusercontent.com', 'G6LwS5vVN9E8aoG-Mat8KZj_', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :twitter, 'FGwVBrcbOZd4Kv96mE3OCNl5y', 'q13TmHSgK7GqxxxcCzYkt8JuiluXlTdua0p9llOfRaxKdpdTah'
end
