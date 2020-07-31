class DmRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dm_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "dm_room_channel", dm: data["dm"]
  end
end
