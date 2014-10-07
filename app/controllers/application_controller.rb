class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include Pundit

  def pundit_user
    if current_therapist
      current_therapist
    else
      current_client
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {
      |u| u.permit(:full_name,
                   :username,
                   :email,
                   :password,
                   :password_confirmation,
                   :remember_me)}
    devise_parameter_sanitizer.for(:sign_in) {
      |u| u.permit(:login,
                   :username,
                   :email,
                   :password,
                   :remember_me)}
    devise_parameter_sanitizer.for(:account_update) {
      |u| u.permit(:full_name,
                   :username,
                   :email,
                   :password,
                   :current_password)}
  end
end
