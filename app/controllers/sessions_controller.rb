class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    auth = request.env['omniauth.auth']

    user = User.find_or_create_for_oauth(auth)
    user.update!(access_token: auth.credentials.token)

    if user.persisted?
      session[:user_id] = user.id
      flash[:notice] = "ログインしました。"
      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session

    flash[:notice] = "ログアウトしました。"
    redirect_to login_path
  end
end
