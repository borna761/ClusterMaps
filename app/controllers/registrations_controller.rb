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
end
