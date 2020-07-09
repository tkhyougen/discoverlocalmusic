class SpotfavoritesController < ApplicationController
  
  def create
    spotfavorite = current_user.spotfavorites.create(spot_id: params[:spot_id])
    redirect_to spot_path(id:params[:spot_id]), notice: "この投稿をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.spotfavorites.find_by(id: params[:id]).destroy
    redirect_to localartists_url, notice: "お気に入り解除しました"
  end
end
