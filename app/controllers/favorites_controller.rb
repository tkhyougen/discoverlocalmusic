class FavoritesController < ApplicationController

  def index

  end

  def create
    favorite = current_user.favorites.create(localartist_id: params[:localartist_id])
    redirect_to localartist_path(id:params[:localartist_id]), notice: "この投稿をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to localartists_url, notice: "この投稿をお気に入り解除しました"
  end
end
