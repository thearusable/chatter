class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      if !params[:password].blank? && params[:password] == params[:password_confirmation]
        logger.info "Updating password"
        resource.password = params[:password]
        resource.save
      end
      if resource.valid?
        resource.update_without_password(params)
      end
    else
      resource.update_with_password(params)
    end
  end

  def fill_profile
    @resource = current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :age, :sex, :orientation, :email, :password, :password_confirmation, :current_password])
  end

end
