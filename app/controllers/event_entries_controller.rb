class EventEntriesController < ApplicationController
  before_action :check_others_event

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
end
