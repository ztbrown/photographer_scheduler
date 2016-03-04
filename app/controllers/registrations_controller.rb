class RegistrationsController < Devise::RegistrationsController
  def create
    params[:user][:role_id] = Role.find_by_name(params[:user][:role]).id
    super
  end
end
