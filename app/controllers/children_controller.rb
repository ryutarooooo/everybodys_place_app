class ChildrenController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    1.upto(3) do |i|
      eval("@child_#{i} = current_user.children.find_or_initialize_by(position: #{i})")
    end
  end

  def update
    @child = current_user.children.find_or_initialize_by(position: params[:child][:position])
    @child.update!(child_params)
    redirect_to edit_child_path, notice: "更新しました"
  end

  def destroy
  end

  private

  def child_params
    params.require(:child).permit(:name, :age, :academic_year, :gender, :truancy_reason, :current_status)
  end
end
