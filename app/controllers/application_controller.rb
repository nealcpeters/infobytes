class ApplicationController < ActionController::Base
  before_filter :configure_parameters, :if => :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :email, :password, :password_confirmation, :first_name, :last_name, :user_name
    end
  end
end
