class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = User.find(current_user[:id])
    @event = @user.created_events.new
  end

  def create
    @user = User.find(current_user[:id])
    @event = @user.created_events.create(event_params)
    redirect_to user_path(@user)
  end

  def attend
    @event = Event.find(params[:id])
    current_user.attended_events << @event
    redirect_to @event, notice: 'successfully attended the event!'
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :category)
  end
end
