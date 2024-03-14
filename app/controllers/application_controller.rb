class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_user!
    if user_signed_in? || devise_controller?
      super
    else
      redirect_to root_path, alert: 'Please sign-in before proceeding'
    end
  end
end
