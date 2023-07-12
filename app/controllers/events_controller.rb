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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :category)
  end
end
