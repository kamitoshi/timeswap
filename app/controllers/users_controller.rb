class UsersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_user, only:[:show, :edit, :image_edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    redirect_to user_path(current_user) unless @user == current_user
  end

  def image_edit
    redirect_to user_path(current_user) unless @user == current_user
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = "プロフィールを変更しました"
        redirect_to user_path(@user)
      else
        render :edit
      end
    else
      flash[:alert] = "他人のプロフィールは編集できません"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if @user == current_user
      if @user.destroy
        redirect_to delete_path
      else
        flash[:alert] = "退会できませんでした"
        redirect_to user_path(current_user)
      end
    else
      flash[:alert] = "他の人を退会させることはできません"
      redirect_to user_path(current_user)
    end
  end

  def delete  
  end

  private
  def user_params
    params.require(:user).permit(:name, :kana_name, :sex, :birthday, :phone_number, :prefecture, :city, :street, :building, :email, :introduction, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
