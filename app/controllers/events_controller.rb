class EventsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  PER = 8

  def index
    range = Date.current..Float::INFINITY
    @events = Event.where(end_time: range).includes(:user).page(params[:page]).per(PER)
    @event_entries_event_ids = current_user.event_entries.pluck(:event_id)
  end

  def show
    @event = Event.find(params[:id])
    # ユーザーが「いいね！」した全てのメッセージidの配列
    @event_entries_event_ids = current_user.event_entries.pluck(:event_id)
    @event_comment = EventComment.new
  end

  def new
    @event = Event.new
  end

  def create
    current_user.events.create!(event_params)
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update!(event_params)
    redirect_to event
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy!
    redirect_to event
  end

  private

  def event_params
    params.require(:event).permit(:name, :prefecture, :place, :title, :content, :count, :price, :image, :start_time, :end_time)
  end

  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    redirect_to events_path if @event.nil?
  end
end
