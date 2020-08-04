class DmRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @receive_user = User.find(params[:id])
    receive_dms = Dm.where(send_user_id: @receive_user.id, receive_user_id: current_user.id)
    receive_dms.each do |notification_dm|
      notification_dm.update_attributes(notification: false)
    end
    notification
    @dms = Dm.where(send_user_id: current_user.id, receive_user_id: @receive_user.id).or(receive_dms).order(id: :asc)
  end
end
