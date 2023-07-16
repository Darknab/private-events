class ParticipationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(attendee_id: current_user.id, attended_event_id: @event.id)
    
    if @participation.save
        redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    Participation.destroy_by(attendee_id: current_user.id, attended_event: @event.id)
    redirect_to @event
  end

  
end
