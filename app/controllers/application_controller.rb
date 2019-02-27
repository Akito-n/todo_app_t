class ApplicationController < ActionController::Base

  include SessionsHelper


rescue_from SecurityError do |exception|
  render file: "#{Rails.root}/public/404.html", layout: false, status: 404
end

def authenticate_admin_user!
  raise SecurityError unless current_user.try(:admin?)
end


  private
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end



end
