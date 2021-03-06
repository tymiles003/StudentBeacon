


class ActivityController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  before_filter :authenticate

  def update_user
    @activity = Activity.new(activity_params)

    @activity.event_time = DateTime.current
    @activity.save
    render :nothing => true, :status => :ok

  end

  def checkin_event

    event_not_found = true

    if (params.has_key?(:event_code))

      # check if is in the format of event::code::checkin_type

      event_param = params[:event_code];
      checkin_type = "unknown"
      event_key = event_param


      if (event_param.include? "::")
        event_params = event_param.split("::")
        event_key = event_params[1]
        checkin_type = event_params[2]
      end

      @event = Event.find_by_code(event_key)

      if (!@event.nil?)
        event_not_found = false
      end

    end

    if (event_not_found)
      render :nothing => true, :status => :bad_request
      return
    end

    @activity = Activity.new(:username => params[:username],
                             :event_time => DateTime.current,
                             :event => "checkin",
                             :beaconid => event_param,
                             :description => checkin_type)


    @activity.save

    render :nothing => true, :status => :ok

  end


  def get_events
    if (params.has_key?(:checkin_time))

      checkin_time = params[:checkin_time];
      # time format expected: '%Y-%m-%d %H:%M:%S %Z',) we are using UTC

      parts = checkin_time.split

      @events = Event.where(" day = :event_day and event_start <= :checkin_time AND event_end >= :checkin_time",
                           checkin_time: parts[1],
                           event_day: parts[0])

      if (!@events.nil?)
        render json: @events, :layout => false, content_type: 'application/json'
      else
        render :nothing => true, :status => :bad_request
      end
    else
      render :nothing => true, :status => :bad_request
    end
  end

  def get_all_events

      @events = Event.all

      if (!@events.nil?)
        render json: @events, :layout => false, content_type: 'application/json'
      else
        render :nothing => true, :status => :bad_request
      end
  end

  def show
    @notifications = Notification.all

    render json: @notifications, :layout => false, content_type: 'application/json'

  end

  private

    def checkin_params
      params.permit(:username, :event_code )
    end
    def activity_params
      params.permit(:username, :beaconid, :event, :description, :owner, )
    end
end
