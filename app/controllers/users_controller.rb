class UsersController < ApplicationController

  #ログイン済みのユーザーのみにアクセスを許可するように
  before_action :authenticate_user!, only:[:show,:index]

  #paginateでの表示数
  PER = 6

  def show
    @user = User.find(params[:id])
    @userartistlists = @user.localartists.page(params[:page]).per(PER)
    @userspots = @user.spots.page(params[:page]).per(PER)
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :remove_image, :comment, :password, :password_confirmation,:tag_list,:country_list,:artist_list)
  end


end
