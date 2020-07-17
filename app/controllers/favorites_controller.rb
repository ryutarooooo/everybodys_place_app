class FavoritesController < ApplicationController
  def create
    current_user.favorites.create!(tweet_id: params[:tweet_id])
    redirect_to tweets_path
  end

  def destroy
    current_user.favorites.find_by(tweet_id: params[:tweet_id]).destroy!
    redirect_to tweets_path
  end
end
