# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ExceptionHandler
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
  end
end
