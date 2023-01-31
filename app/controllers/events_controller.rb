class EventsController < ApplicationController
  def index
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'Event successfully created'
    else
      flash.now[:alert] = 'Event not saved, correct the errors'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :description, :user_id)
  end

end

