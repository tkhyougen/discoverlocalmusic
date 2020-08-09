class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  PER = 12

  def index
    @spots = Spot.all.order(id: :desc)
    @user = current_user
    #ransack
    @search = Spot.ransack(params[:q])
    @spots = @search.result(id: :desc)

    @spots = @spots.order(id: :desc).page(params[:page]).per(PER)
  end

  def new
    if params[:back]
      @spot = Spot.new(spot_params)
    else
      @spot = Spot.new
    end
  end

  def confirm
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    render :new if @spot.invalid?
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @spot.save!
        redirect_to spots_path, notice:"作成しました"
      else
        render :new
      end
    end
  end

  def edit
    #set_spot
  end

  def update
    #set_spot
    if @spot.update(spot_params)
      redirect_to spot_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def show
    #set_spot
    @spotcomments = @spot.spotcomments.all.order('created_at DESC')
    @spotcomment = @spot.spotcomments.build
    @spotfavorite = current_user.spotfavorites.find_by(spot_id: @spot.id)
  end


  def destroy
    @spot.destroy
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users/registrations"
      redirect_to edit_user_registration_path(current_user.id), notice:"削除しました"
    else
      redirect_to spots_path, notice:"削除しました"
    end
  end


  private

    def set_spot
      @spot = Spot.find(params[:id])
    end

    def spot_params
      params.require(:spot).permit(:name, :country, :image, :image_cache, :post_comment, :genre, :address,:latitude,:longitude)
    end
end
