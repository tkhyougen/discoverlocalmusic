class ApplicationController < ActionController::Base
  # csrf
  protect_from_forgery with: :exception

  # ログインしていないと一切の投稿や閲覧ができないようにする
  # before_action :check_user, unless: :devise_controller?

  # 下のdef configure..を実行
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:comment])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:image])
    devise_parameter_sanitizer.permit(:account_update, keys:[:comment])
    devise_parameter_sanitizer.permit(:account_update, keys:[:remove_image])
    devise_parameter_sanitizer.permit(:account_update, keys:[:tag_list])
    devise_parameter_sanitizer.permit(:account_update, keys:[:password])
    devise_parameter_sanitizer.permit(:account_update, keys:[:current_password])
  end

  def check_user
    unless user_signed_in?
      flash[:notice] = "ログインもしくは新規登録してください"
      redirect_to new_user_registration_path, notice:"ログインもしくは新規登録してください"
    end
  end

end
