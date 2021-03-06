class EventsController < ApplicationController
  before_action :authenticate_user, only: :new
  def index
    @finished_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(form_params)
    if @event.save
      @event.event_attendances.create(attendee_id: current_user[:id])
      flash.notice = 'Event successfully created'
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def form_params
    params.require(:event).permit(:name, :date)
  end

  def authenticate_user
    unless logged_in?
      flash.alert = 'You need to login'
      redirect_to login_path
    end
  end
end
