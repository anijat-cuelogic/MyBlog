class RegistrationsController < Devise::RegistrationsController
  after_filter :add_role

  protected

  def add_role
    if resource.persisted? # user is created successfuly
      role = Role.where(name: "registered_user").first_or_create
      resource.roles << role
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, images_attributes: [:attachment])
  end
end