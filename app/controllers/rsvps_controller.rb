class RsvpsController < ApplicationController
  
  def index
  end

  # allow a user to create an RSVP/invitation
  def new
    # @rsvp = current_user.attended_events.build(event_params)
  
    #   if @event.save
    #     redirect_to @event, notice: 'Event successfully RSVPd'
    #   else
    #     flash.now[:alert] = 'RSVP not saved, correct the errors'
    #     render :new, status: :unprocessable_entity
    #   end
  end

  # allow a user to become an “attendee” of an event
  def accept
    # @event = Event.find(params[:id])
    # @event.invited_users.delete(current_user)
    # flash[:notice] = "Your presence in '#{@event.name}' is confirmed!"
    # @event.attendees << current_user
    # redirect_to all_events_path

    # event = Event.find(params[:event_id])
    # rsvp = Rsvp.new(attended_event_id: event.id, attendee_id: params[:user_id])
  
    #   if rsvp.save
    #     # rsvp.invited!
    #     flash[:notice] = "Your presence in '#{event.title}' is confirmed!"
    #     redirect_to events_path
    #   else
    #     flash.now[:alert] = 'Ooops! Something went wrong...'
    #     redirect_to event_path(event)
    #   end

      @event = Event.find(params[:event_id])
      if @event.attendees.include?(current_user)
        redirect_to @event, notice: "You are already on the list"
      else
        @event.attendees << current_user
        redirect_to @event, notice: "You RSVPd! Thank you"
      end

    
  end

  # allow a user to deny an event, remove self as “attendee”
  def refuse
  end
end
