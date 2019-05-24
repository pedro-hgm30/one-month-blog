class ApplicationController < ActionController::Base
  
  # this is devise stuff
  # I'm using my own controller in some parts of the code
  # and I have to specify this for devise

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
  
end
