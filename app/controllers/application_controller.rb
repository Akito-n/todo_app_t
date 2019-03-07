class ApplicationController < ActionController::Base
  include SessionsHelper

rescue_from SecurityError do |_exception|
  render file: "#{Rails.root}/public/404.html", layout: false, status: 404
end


def authenticate_admin_user!
  raise SecurityError unless current_user&.admin?
end


  private

  def require_user_logged_in
    redirect_to login_url unless logged_in?
  end
end
