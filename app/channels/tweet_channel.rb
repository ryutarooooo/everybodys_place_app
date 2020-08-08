class TweetChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tweet_channel_#{params["tweet"]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_user.comments.create!(
      content: data["comment"],
      tweet_id: params["tweet"],
      mention_user_id: data["mention_user_id"],
    )
  end
end
