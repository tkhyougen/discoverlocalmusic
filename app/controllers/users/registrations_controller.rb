# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action  :set_user_tags_to_gon, only: [:edit]

  # def after_sign_up_path_for(resource)
  #   '/users'
  # end

  #paginateでの表示数
  PER = 6

    # GET /resource/edit
  def edit
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    @userartistlists = @user.localartists.page(params[:page]).per(PER)
    @userspots = @user.spots.page(params[:page]).per(PER)
    super
  end

  # # PUT /resource
  def update
    super
  end

  # # DELETE /resource
  # def destroy
  #   super
  # end

  # def cancel
  #   super
  # end

  protected

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
  # The path used after sign up.
  def after_update_path_for(resource)
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
    params.require(:user).permit(:name, :email, :image, :image_cache, :comment,:password, :password_confirmation,:tag_list,:country_list,:artist_list)
  end

  #editにてタグを表示
  def set_user_tags_to_gon
    gon.user_tags = @user.tag_list
  end

  #オートコンプリート
  def set_available_tags_to_gon
    gon.available_tags = User.tags_on(:tags).pluck(:name)
  end

end
