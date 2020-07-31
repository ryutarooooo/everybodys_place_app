class DmRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dms = Dm.all
  end
end
