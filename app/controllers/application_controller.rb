class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

 
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message

   end

   def after_sign_in_path_for(resource)
       topics_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :name, :email, :password, :password_confirmation, :current_password, :email_favorites) }
  end



