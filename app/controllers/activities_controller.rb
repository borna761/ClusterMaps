class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activities = Activity.all
    @cc = ActivityType.find_by_name('Children\'s Class').activities
    @dm = ActivityType.find_by_name('Devotional Meeting').activities
    @jy = ActivityType.find_by_name('Junior Youth Group').activities
    @sc = ActivityType.find_by_name('Study Circle').activities
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
      format.js {}
      format.html {}
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

private
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:startDate, :longitude, :latitude, :participants, :comments, :hostedBy, :activity_type_id)
  end

end
