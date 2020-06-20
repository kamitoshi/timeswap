class SuggestsController < ApplicationController
  before_action :set_suggest, only:[:show, :edit, :update, :destroy]

  def index
    @suggests = Suggest.all
  end

  def show
  end

  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggests.build(suggest_params)
    if @suggest.save
      flash[:success] = "掲載しました"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "掲載できませんでした"
      render :new
    end
  end

  def edit
    redirect_to user_path(current_user) unless current_user == @suggest.user
  end

  def update
    if @suggest.user == current_user
      if @suggest.update(suggest_params)
        flash[:success] = "掲載情報を編集しました"
        redirect_to suggest_path(@suggest)
      else
        flash[:alert] = "掲載情報を編集できませんでした"
        render :edit
      end
    else
      flash[:alert] = "自分以外の掲載は編集できません"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if @suggest.user == current_user
      if @suggest.destroy
        flash[:success] = "掲載情報を削除しました"
        redirect_to user_path(current_user)
      else
        flash[:alert] = "掲載情報を削除できませんでした"
        redirect_to user_path(current_user)
      end
    else
      flash[:alert] = "自分以外の掲載情報は削除できません"
      redirect_to user_path(current_user)
    end
  end

  private
  def suggest_params
    params.require(:suggest).permit(:title, :detail, :price, :start_datetime, :end_datetime, :status)
  end

  def set_suggest
    @suggest = Suggest.find(params[:id])
  end

end
