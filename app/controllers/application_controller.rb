class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_query

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(user)
    courses_path
  end

  private

  def set_query
    @q = Course.ransack(params[:q])
  end

end
