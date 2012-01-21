class SessionsController < ApplicationController
  def create
    user = User.from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:notice] = "Welcome #{user.nickname}"
    redirect_to posts_path
  end

  def new
    flash[:failure_provider] = request.env['omniauth.error.strategy'].name
    flash[:failure_type] = request.env['omniauth.error.type']
  end
end
