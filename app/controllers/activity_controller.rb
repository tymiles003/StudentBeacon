

class ActivityController < ApplicationController
  # before_action CASClient::Frameworks::Rails::Filter
  # before_action :set_Activity, only: [:getconfig, :update_user]
  # append_before_action RubyCAS::Filter
  skip_before_filter :verify_authenticity_token

  def update_user
    @activity = Activity.new(activity_params)

    @activity.event_time = DateTime.current
    @activity.save
    render :nothing => true, :status => :ok

  end

  def show
    @notifications = Notification.all

    render json: @notifications, :layout => false, content_type: 'application/json'

  end

  private
    def activity_params
      params.permit(:username, :beaconid, :event, :description, :owner, )
    end
end
