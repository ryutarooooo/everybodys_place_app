class DmRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @receive_user = User.find(params[:id])
    @dms = Dm.where(send_user_id: current_user.id, receive_user_id: @receive_user.id).or(Dm.where(send_user_id: @receive_user.id, receive_user_id: current_user.id)).order(id: :asc)
  end
end
