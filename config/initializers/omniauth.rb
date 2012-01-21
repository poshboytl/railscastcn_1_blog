OmniAuth.config.on_failure do |env|
  [302, {'Location' => "/auth/#{env['omniauth.error.strategy'].name}/failure?message=#{env['omniauth.error.type']}"}, ["Redirecting..."]]
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'd78181e1ec709f32d844',
    '7fd79b37dd8a4423c598b9f6ae6d4fe358af11dc'

  provider :identity, :fields => [:nickname, :email]#, on_failed_registration: UsersController.action(:new)
end
