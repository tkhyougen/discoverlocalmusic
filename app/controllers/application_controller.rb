class ApplicationController < ActionController::Base
  # csrf
  protect_from_forgery with: :exception
  


  # 下のdef configure..を実行
  before_action :configure_permitted_parameters, if: :devise_controller?
    #name image commentの操作を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:comment])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:image])
    devise_parameter_sanitizer.permit(:account_update, keys:[:comment])
  end


end
