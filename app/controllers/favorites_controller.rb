class FavoritesController < ApplicationController

  PER = 12

  def index
    binding.pry
    @userfavartists = current_user.favorite_localartists.all.order('created_at DESC')
    @userfavartists = @userfavartists.order('created_at DESC').page(params[:page]).per(PER)
    @userfavspots = current_user.spotfavorite_spots.all.order('created_at DESC')
    @userfavspots = @userfavspots.order('created_at DESC').page(params[:page]).per(PER)

    # @favorite = current_user.favorites.find_by(localartist_id: @localartist.id)
  end

  def create
    favorite = current_user.favorites.create(localartist_id: params[:localartist_id])
    redirect_to localartist_path(id:params[:localartist_id]), notice: "この投稿をお気に入り登録しました"
  end
  def destroy

    path = Rails.application.routes.recognize_path(request.referer)
    #path[:contoller]で遷移元によってredirect_toでの戻り先を変更
    if path[:controller] == "localartists"
    #localartist showから直接
      favorite = current_user.favorites.find_by(id: params[:id]).destroy
      redirect_to localartist_path(id:favorite.localartist_id), notice: "お気に入り解除しました"
    else
    #user profileから
      favorite = current_user.favorites.find_by(localartist_id: params[:id]).destroy
      redirect_to favorites_path(current_user.id), notice: "お気に入り解除しました"
    end
  end
end
