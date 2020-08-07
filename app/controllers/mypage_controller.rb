class MypageController < ApplicationController
  def edit
  end

  def show
  end

  def update
    if params[:user][:profile_image].present?
      current_user.update!(image_params)
    else
      current_user.update!(user_params)
      redirect_to edit_mypage_path, notice: "更新しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :child_name, :child_age, :place, :hobby, :using_reason, :trouble, :hope, :content)
  end

  def image_params
    params.require(:user).permit(:profile_image)
  end
end
