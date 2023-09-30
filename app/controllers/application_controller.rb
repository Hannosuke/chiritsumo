class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :basic_auth if Rails.env.production?
  before_action :require_login

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["BASIC_AUTH_NAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
