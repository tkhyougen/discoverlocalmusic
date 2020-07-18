class SpotfavoritesController < ApplicationController


  PER = 12

  def index
    @userfavartists = current_user.favorite_localartists.all.order('created_at ASC')
    @userfavartists = @userfavartists.page(params[:page]).per(PER)

  end


  def create
    spotfavorite = current_user.spotfavorites.create(spot_id: params[:spot_id])
    redirect_to spot_path(id:params[:spot_id]), notice: "この投稿をお気に入り登録しました"
  end
  def destroy
    path = Rails.application.routes.recognize_path(request.referer)
    #path[:contoller]で遷移元によってredirect_toでの戻り先を変更
    if path[:controller] == "spots"
      #spot showから直接
      favorite = current_user.spotfavorites.find_by(id: params[:id]).destroy
      binding.pry
      redirect_to spot_path(id:favorite.spot_id), notice: "お気に入り解除しました"
    else
      #user profileから
      favorite = current_user.spotfavorites.find_by(spot_id: params[:id]).destroy
      binding.pry
      redirect_to favorites_path(current_user.id), notice: "お気に入り解除しました"
    end
  end
end
