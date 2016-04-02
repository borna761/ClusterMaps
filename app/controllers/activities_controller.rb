class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @activity = Activity.new
    @cc = ActivityType.find_by_name('Children\'s Class').activities
    @dm = ActivityType.find_by_name('Devotional Meeting').activities
    @jy = ActivityType.find_by_name('Junior Youth Group').activities
    @sc = ActivityType.find_by_name('Study Circle').activities
  end

  def new
    @activity = Activity.new
  end

  def create
    @activities = Activity.all
    @activity = Activity.create(activity_params)

    respond_to do |format|
      format.html { redirect_to activities_path }
      format.js
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activities = Activity.all
    @activity = Activity.find(params[:id])

    @activity.update_attributes(activity_params)
  end

  def delete
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activities = Activity.all
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

private
  def activity_params
    params.require(:activity).permit(:startDate, :location, :participants, :comments, :activity_type_id)
  end

end
