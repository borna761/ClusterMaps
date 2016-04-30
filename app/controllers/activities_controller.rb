class ActivitiesController < ApplicationController

  before_action :setActivity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # 404
  rescue_from ActiveRecord::RecordNotFound do |exception|
    rescue_record_not_found(exception)
  end

  def index
    @activities = Activity.all
    @json = Gmaps4rails.build_markers(@activities) do |activity, marker|
      @activity = activity
      marker.lat activity.lat
      marker.long activity.long
    end

    @cc = ActivityType.find_by_name('Children\'s Class').activities
    @dm = ActivityType.find_by_name('Devotional Meeting').activities
    @jy = ActivityType.find_by_name('Junior Youth Group').activities
    @sc = ActivityType.find_by_name('Study Circle').activities
  end

  def show
    respond_with(@activity, :layout =>  !request.xhr?)
  end

  def new
    @activity = Activity.new(params[:activity].present? ? activity_params : nil)
    respond_with(@activity, :layout => !request.xhr?)
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity created.' }
        format.js {}
      else
        format.html { render action: 'new' }
        format.js {}
      end
    end
  end

  def edit
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity updated.' }
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
  def setActivity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:startDate, :location, :participants, :hostedBy, :comments, :activity_type_id)
  end

  def rescue_record_not_found(exception)
    respond_to do |format|
      format.html
      format.js { render :template => "activities/404.js.erb", :locals => {:exception => exception} }
    end
  end
end
