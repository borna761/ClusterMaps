class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    Cluster.find(1).cluster_users.create(user: current_user, default: true)
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end
end
