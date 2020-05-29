# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # users/sign_in
  def new
    super
  end


  def create
    binding.pry
    # super
    user = User.find_by(email: params[:user][:email].downcase)
    current_user = user
    redirect_to user_path(user.id), notice:"riguin"
    # user = User.find_by(email: params[:user][:email].downcase)
    # if user.find_by(params[:user][:password])
    #   session[:user_id] = user.id
    #   redirect_to user_path(user.id), notice:"ろぐいんしました"
    # else
    #   flash.now[:danger] = "ログインに失敗しました"
    #   render :new
    # end
  end

  # DELETE /users/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
