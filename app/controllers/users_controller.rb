class UsersController < ApplicationController

  #ログイン済みのユーザーのみにアクセスを許可するように
  # before_action :authenticate_user!, only:[:show,:index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :remove_image, :comment, :password, :password_confirmation)
  end

end
