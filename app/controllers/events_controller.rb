class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "You have successfully deleted '#{@event.title}'."
    redirect_to root_path status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :description, :user_id)
  end

end
