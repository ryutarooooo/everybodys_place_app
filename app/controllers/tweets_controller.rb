class TweetsController < ApplicationController
  before_action :authenticate_user!

  before_action :correct_user, only: %i[edit update destroy]

  def index
    @tweets = Tweet.includes(:user).order(updated_at: "desc")
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    current_user.tweets.create!(tweet_params)
    redirect_to tweets_path
  end

  def edit
  end

  def update
    @tweet.update!(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweet.destroy!
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end

  def correct_user
    @tweet = current_user.tweets.find_by(id: params[:id])
    redirect_to tweets_path if @tweet.nil?
  end
end
