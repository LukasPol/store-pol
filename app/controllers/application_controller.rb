class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :email, :password, :password_confirmation, :gender_id, :birthday, :phone, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :current_password, :password, :password_confirmation, :gender_id, :birthday, :phone, :avatar])
    end

    # layout :layout_by_resource

  private
    def layout_by_resource
      if devise_controller? && !request.fullpath.match?('/users/edit') && !(request.fullpath.match('/users') && params[:action] == 'update')
        'login'
      else
        'application'
      end
    end
end
