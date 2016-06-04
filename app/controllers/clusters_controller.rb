class ClustersController < ApplicationController
  before_action :authenticate_user!

  def index
    @userclusters = current_user.cluster_users.includes(:cluster).order("clusters.name")
    @otherusers = User.where.not(id: current_user.id)
  end

  def new
    @cluster = Cluster.new(cluster_params)
    @cluster.owner = current_user
    if @cluster.save
      @cluster.cluster_users.create(user: current_user)
    end
    redirect_to clusters_path
  end

  def update
    @cluster = Cluster.find(params[:id])
    cluster = params[:cluster]
    newOwner = User.find(cluster[:owner])
    @cluster.owner = newOwner
    @cluster.save
    redirect_to clusters_path
  end

  private
  def cluster_params
    params.require(:cluster).permit(:name, :owner)
  end
end
