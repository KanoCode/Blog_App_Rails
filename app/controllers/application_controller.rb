class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email name photo bio password password_confirmation admin])
  end
end
