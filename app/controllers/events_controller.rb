class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @events = Event.all
    else
      @events = Event.public_event
    end
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

  def invite
    @event = Event.find(params[:id])
    @users = User.all
    
    invited_users = User.where(id: params[:user_ids])

    invited_users.each do |user|
      @event.participations.create(attendee_id: user.id)
    end

    redirect_to event_path(@event)

  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :category)
  end
end
