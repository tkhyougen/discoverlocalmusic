class LocalartistsController < ApplicationController
  before_action :set_localartist, only: [:show, :edit, :update, :destroy]
  before_action :set_localartist_tags_to_gon, only: [:edit]


  def index

    @localartists = Localartist.all.order(id: :desc)
    @user = current_user
    #ransack
    # @search = Localartist.ransack(params[:q])
    # @posts = @search.result
    #ransack

    #検索結果の表示
    if params[:search].present?
      if params[:search][:name].present? && params[:search][:country].present? && params[:search][:tag_list].present?
        @localartists = Localartist.all.where("name ilike ?", "%#{params[:search][:name]}%")
        @localartists = @localartists.all.where("country ilike ?", "%#{params[:search][:country]}%")
        @localartists = @localartists.tagged_with(params[:search][:tag_list])

      elsif params[:search][:name].present? && params[:search][:country].present?
        @localartists = Localartist.all.where("name ilike ?", "%#{params[:search][:name]}%")
        @localartists = @localartists.all.where("country ilike ?", "%#{params[:search][:country]}%")

      elsif params[:search][:country].present? && params[:search][:tag_list].present?
        @localartists = Localartist.all.where("country ilike ?", "%#{params[:search][:country]}%")
        @localartists = @localartists.tagged_with(params[:search][:tag_list])

      elsif params[:search][:name].present? && params[:search][:tag_list].present?
        @localartists = Localartist.all.where("name ilike ?", "%#{params[:search][:name]}%")
        @localartists = @localartists.tagged_with(params[:search][:tag_list])

      elsif params[:search][:name].present?
        @localartists = Localartist.all.where("name ilike ?", "%#{params[:search][:name]}%")

      elsif params[:search][:country].present?
        @localartists = Localartist.all.where("country ilike ?", "%#{params[:search][:country]}%")

      elsif params[:search][:tag_list].present?
          @localartists = Localartist.tagged_with(params[:search][:tag_list])
      end
    end
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
    if @localartist.update(localartist_params)
      redirect_to localartist_path, notice: "情報を編集しました！"
    else
      render :edit
    end
  end

  def show
    #ser_localrtist
    @comments = @localartist.comments.all.order('created_at DESC')
    @comment = @localartist.comments.build

    #youtube api
    @youtube_data = find_videos("#{@localartist.country} #{@localartist.name}")

  end

  def destroy
    @localartist.destroy
    redirect_to edit_user_registration_path(current_user.id), notice:"削除しました"
  end


  private

  def localartist_params
    params.require(:localartist).permit(:image, :name, :comment,:country, :post_comment, :tag_list, :who_list)
  end

  def set_localartist
    @localartist = Localartist.find(params[:id])
  end

  def set_localartist_tags_to_gon
    if @localartist.tag_list.present?
      gon.localartist_tags = @localartist.tag_list
    end
  end


end
