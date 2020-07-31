class DmBroadcastJob < ApplicationJob
  queue_as :default

  def perform(dm)
    ActionCable.server.broadcast "dm_room_channel", dm: render_dm(dm)
  end

  private

  def render_dm(dm)
    ApplicationController.renderer.render partial: "dms/dm", locals: { dm: dm }
  end
end
