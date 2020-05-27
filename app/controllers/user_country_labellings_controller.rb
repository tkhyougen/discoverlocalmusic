class UserCountryLabellingsController < ApplicationController
  #中間ラベル

  # userが登録している国の作成
  def create
    user_country_labelling = current_user.user_country_labellings.create(user_country_label_id: params[:user_country_label_id])
  end

  # userが登録している国の表示
  def show
    @user_country_labelling = current_user.user_country_labellings.find_by(user_country_label_id:@user_country_label.id)
  end

  # userが登録している国の削除
  def destroy
    user_country_labelling = current_user.user_country_labellings.find_by(id: params[:id]).destroy
    # redirect_to
  end

end
