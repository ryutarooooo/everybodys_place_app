class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notification

  def notification
    if user_signed_in?
      @notification_dms = current_user.passive_dms.where(notification: true)
      @notification_count = @notification_dms.count
    end
  end
end
