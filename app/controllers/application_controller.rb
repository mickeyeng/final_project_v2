class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_picture, :first_name, :last_name, :degree_level, :course])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_picture, :first_name, :last_name, :degree_level, :course])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :profile_picture) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :profile_picture) }
  # end

  

end
