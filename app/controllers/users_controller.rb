class UsersController < ApplicationController

  #ログイン済みのユーザーのみにアクセスを許可するように
  # before_action :authenticate_user!, only:[:show,:index]

  def show
    @user = User.find(params[:id])
  end

  def index
    binding.pry
    @users = User.all
  end

end
