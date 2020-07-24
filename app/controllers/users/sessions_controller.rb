class Users::SessionsController < Devise::SessionsController

  # users/sign_in
  # def new
  #   super
  # end

  # def create
  #   binding.pry
  #   super
  # end

  # DELETE /users/sign_out
  # def destroy
  #   super
  # end

  protected
  # サインイン後はマイページへ
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

end
