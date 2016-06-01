class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_cluster, only: [:index, :stats]

  respond_to :html

  def index
    @cc = @clusteractivities.joins(:activity_type).where("activity_types.name" => "Children's Class")
    @dm = @clusteractivities.joins(:activity_type).where("activity_types.name" => "Devotional Meeting")
    @jy = @clusteractivities.joins(:activity_type).where("activity_types.name" => "Junior Youth Group")
    @sc = @clusteractivities.joins(:activity_type).where("activity_types.name" => "Study Circle")
  end

  def show
    respond_with(@activity, :layout => !request.xhr?)
  end

  def new
    @activity = Activity.new(params[:activity].present? ? activity_params : nil)
    respond_with(@activity, :layout => !request.xhr?)
  end

  def edit
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @activity = Activity.new(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity }
        format.js {}
      else
        format.html { render action: 'new' }
        format.js {}
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity }
        format.js {}
      else
        format.html { render action: 'edit' }
        format.js {}
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.js {}
    end
  end

  def stats
    activityType = params[:activityType]
    @activities = @clusteractivities.joins(:activity_type).where("activity_types.icon" => activityType).order(:id) #ActivityType.find_by_icon(activityType).activities.order(:id)
    respond_to do |format|
      format.html
      format.json { render json: @activities }
    end
  end

private
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def get_cluster
    @userclusters = current_user.cluster_users.joins(:cluster).order("clusters.name")
    @defaultcluster = @userclusters.find_by(:default => true).cluster

    if params[:cluster].present? && (params[:cluster].to_i.in? current_user.cluster_users.map(&:cluster_id))
      @selectedcluster = Cluster.find(params[:cluster])
    else
      @selectedcluster = @defaultcluster
    end

    @clusteractivities = @selectedcluster.activities
  end

  def activity_params
    params.require(:activity).permit(:startDate, :longitude, :latitude, :participants, :comments, :hostedBy, :uniquefield, :teacherTutorAnimator, :activity_type_id, :cluster_id)
  end

end
