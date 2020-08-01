class DmBroadcastJob < ApplicationJob
  queue_as :default

  def perform(dm)
    first_id, second_id = [dm.send_user_id, dm.receive_user_id].sort
    ActionCable.server.broadcast "dm_room_channel_#{first_id}_#{second_id}", dm: render_dm(dm)
  end

  private

  def render_dm(dm)
    ApplicationController.renderer.render partial: "dm_rooms/dm", locals: { dm: dm, send_user: dm.send_user, receive_user: dm.receive_user }
  end
end
