class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :index, :about, :show], if: :use_auth?


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email ,:password])
  end

   def use_auth?
    unless admin_signed_in?
      true
    end
   end

end
