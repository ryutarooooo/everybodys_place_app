class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notification

  def notification
    if user_signed_in?
      @dms = Dm.where(receive_user_id: current_user.id).where()
    end
  end
end
