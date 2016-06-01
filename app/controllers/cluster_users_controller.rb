class ClusterUsersController < ApplicationController
  def create
    clusterParams = params[:cluster_user]
    clusterId = clusterParams[:cluster].to_i
    userId = clusterParams[:user].to_i
    if (clusterId.in? current_user.cluster_users.map(&:cluster_id))
      cluster = Cluster.find(clusterId)
      user = User.find(userId)
      cluster.cluster_users.create(user: user)
    end
    redirect_to clusters_path
  end

  def update
    currentDefault = current_user.cluster_users.find_by_default(true)
    currentDefault.default = false
    currentDefault.save
    newDefault = current_user.cluster_users.find_by_cluster_id(params[:defaultCluster])
    newDefault.default = true
    newDefault.save
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def delete
    clusterUser = ClusterUser.find(params[:id])
    # if default is being deleted, make "Test Cluster" default
    if clusterUser.default
      newDefault = current_user.cluster_users.find_by_cluster_id(1)
      newDefault.default = true
      newDefault.save
    end

    # if last user of cluster, delete the cluster too
    if clusterUser.cluster.users.count == 1
      clusterUser.cluster.destroy
    end
    clusterUser.destroy
    redirect_to clusters_path
  end
end
