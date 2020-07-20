class EventCommentsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @event_comment = EventComment.new
  end

  def create
    current_user.event_comments.create!(event_comment_params)
    redirect_to event_path(params[:event_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_comment_params
    params.require(:event_comment).permit(:content).merge params.permit(:event_id)
  end

  def correct_user
    @event_comment = current_user.event_comments.find_by(id: params[:id])
    redirect_to events_path if @event_comment.nil?
  end
end
