class EventEntriesController < ApplicationController
  before_action :check_others_event
  before_action :check_capacity, only: %i[create]

  def create
    current_user.event_entries.create!(event_id: params[:event_id])
    redirect_to events_path
  end

  def destroy
    current_user.event_entries.find_by(event_id: params[:event_id]).destroy!
    redirect_to events_path
  end

  private

  def check_others_event
    if Event.find(params[:event_id]).user_id == current_user.id
      redirect_to events_path
    end
  end

  def check_capacity
    if event.event_entries_count >= event.count
      redirect_to event
    end
  end
end
