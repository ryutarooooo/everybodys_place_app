class EventsController < ApplicationController
  def index
    @events = Event.includes(:user)
    @event_entries_event_ids = current_user.event_entries.pluck(:event_id)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
