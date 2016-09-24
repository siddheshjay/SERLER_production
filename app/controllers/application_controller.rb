class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

=begin
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email,:password, :password_confirmation, roles: []) }
  end
=end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation, {roles: []}])
  end

end
