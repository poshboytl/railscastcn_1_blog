Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'd78181e1ec709f32d844',
    '7fd79b37dd8a4423c598b9f6ae6d4fe358af11dc'
end
