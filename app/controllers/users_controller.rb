# frozen_string_literal: true

# users_controller
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.last
  end

  def show_user
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'Пользователь успешно создан' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    return unless @user.id == current_user.id
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь был успешно удален' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
