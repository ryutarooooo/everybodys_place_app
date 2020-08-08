class CommentsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def create
    current_user.comments.create!(comment_params)
    redirect_to tweet_path(params[:tweet_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge params.permit(:tweet_id).merge
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to tweets_path if @comment.nil?
  end
end
