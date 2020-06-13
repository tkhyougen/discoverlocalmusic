class LocalartistsController < ApplicationController
  before_action :set_localartist, only: [:show, :edit, :update, :destory]

  def index
    @localartists = Localartist.all
  end

  def new
    if params[:back]
    @localartist = Localartist.new(localartist_params)
    else
    @localartist = Localartist.new
    end
  end

  def confirm
    @localartist = Localartist.new(localartist_params)
    @localartist.user_id = current_user.id
    render :new if @localartist.invalid?
  end

  def create
    @localartist = Localartist.new(localartist_params)
    @localartist.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @localartist.save!
        redirect_to localartists_path, notice:"作成しました"
      else
        render :new
      end
    end
  end

  def edit
    #set_localrtist
  end

  def update
    #set_localrtist
    @localartist.update(localartist_params)
    redirect_to localartists_path, notice: "情報を編集しました！"
  end

  def show
    #ser_localrtist
  end

  def destroy
    @loalartist.destroy
    redirect_to localartists_path, notice:"削除しました"
  end


  private

  def localartist_params
    params.require(:localartist).permit(:image, :name, :comment,:country, :post_comment, :tag_list)
  end

  def set_localartist
    @localartist = Localartist.find(params[:id])
  end

end
