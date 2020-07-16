class MypageController < ApplicationController
  # before_action :correct_user, only: %i[edit show update]

  def edit
  end

  def show
  end

  def update
    current_user.update!(user_params)
    redirect_to edit_mypage_path
  end

  def user_params
    params.require(:user).permit(:name, :age, :place, :career, :using_reason, :content)
  end
end
