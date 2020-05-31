# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # def after_sign_up_path_for(resource)
  #   '/users'
  # end

  # アカウント編集後、プロフィール画面に移動する
  # def after_update_path_for(resource)
  #   user_path(id: current_user.id)
  # end

  # GET /resource/sign_up
  # def new
  #   @user = User.new
  # end
  #
  # # POST /resource
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     sign_in @user
  #     redirect_to user_path(@user.id), notice:"ログインしました"
  #   else
  #     render :new
  #   end
  # end

  # def confirm
  #   @user = User.new(sing_up_params)
  #     render :action => "confirm"
  #   else
  #     render :action => "new"
  #   end
  # end

  # def complete
  #   render :action => "complete"
  # end

  # GET /resource/edit
  def edit
    # @user = User.find(params[:id])
    super
  end
  #
  # # PUT /resource
  # def update
  #   super
  # end
  #
  # # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  def after_sign_up_path_for(resource)
    binding.pry
    user_path(resource)
  end
  # The path used after sign up.
  def after_update_path_for(resource)
    binding.pry
    user_path(resource)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :comment,:password, :password_confirmation,:usercountry_list,:userartist_list)
  end

end
