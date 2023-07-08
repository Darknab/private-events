class EventsController < ApplicationController
  def index
    @events = Event.all
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

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :category)
  end
end
