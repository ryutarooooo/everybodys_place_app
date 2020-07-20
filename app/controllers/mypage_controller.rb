class MypageController < ApplicationController
  # before_action :correct_user, only: %i[edit show update]

  def edit
  end

  def show
  end

  def update
    current_user.update!(user_params)
    redirect_to edit_mypage_path, notice: "更新しました"
  end

  def user_params
    params.require(:user).permit(:name, :age, :place, :profile_image, :hobby, :using_reason, :trouble, :hope, :content)
  end
end
