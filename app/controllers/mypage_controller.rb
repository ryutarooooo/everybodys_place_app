class MypageController < ApplicationController
  def edit
  end

  def show
  end

  def update
    current_user.update!(user_params)
    redirect_to edit_mypage_path, notice: "更新しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :place, :gender, :profile_image, :hobby, :using_reason, :trouble, :hope, :content)
  end
end
