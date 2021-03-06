class DmRoomChannel < ApplicationCable::Channel
  def subscribed
    first_id, second_id = [current_user.id, params["receive_user_id"]].sort
    stream_from "dm_room_channel_#{first_id}_#{second_id}"
  end

  def unsubscribed
  end

  def speak(data)
    Dm.create! content: data["dm"], send_user_id: current_user.id, receive_user_id: params["receive_user_id"]
  end
end
