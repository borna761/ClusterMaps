class ClustersController < ApplicationController
  before_action :authenticate_user!

  def index
    @userclusters = current_user.cluster_users.includes(:cluster).order("clusters.name")
    @cluster = Cluster.new
  end

  def new
    @cluster = Cluster.new(cluster_params)
    if @cluster.save
      @cluster.cluster_users.create!(user: current_user)
    end
    redirect_to clusters_path
  end

  private
  def cluster_params
    params.require(:cluster).permit(:name)
  end
end
