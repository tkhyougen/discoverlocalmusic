class LocalartistsController < ApplicationController
  before_action :set_localartist, only: [:show, :edit, :update, :destroy]
  before_action :set_availables_tags_to_gon, only: [:new, :edit]
  before_action :set_localartist_tags_to_gon, only: [:edit]
  PER = 12

  def index
    @localartists = Localartist.all.order(id: :desc)
    @user = current_user
    #ransack
    # @search = Localartist.ransack(params[:q])
    # @localartists = @search.result

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
          @localartists = Localartist.all.tagged_with([params[:search][:tag_list]], :any => true)
      end
    end
    @localartists = @localartists.order(id: :desc).page(params[:page]).per(PER)
  end


  def new
    # "path"を取得し viewにて場合わけ
    path = Rails.application.routes.recognize_path(request.referer)
    if params[:back]
      @localartist = Localartist.new(localartist_params)
      @localartist.youtubes.build
    else
      @localartist = Localartist.new
      @localartist.youtubes.build
    end
  end

  def confirm
    @localartist = Localartist.new(localartist_params)
    # @localartist.youtubes.build
    @localartist.user_id = current_user.id
    render :new if @localartist.invalid?
    @youtubes = @localartist.youtubes
  end

  def create
    @localartist = Localartist.new(localartist_params)
    @localartist.user_id = current_user.id
    # set_youtube

    if params[:back]
      #戻るで再入力の際にタグを残す
      set_localartist_tags_to_gon
      render :new
    else
      if @localartist.save!
        # @youtube_data = Yotube.new
        # @youtube_data.url = find_videos("#{@localartist.country}, #{@localartist.name}")
        # @youtube_data.save
        redirect_to localartists_path, notice:"作成しました"
      else
        render :new
      end
    end
  end

  def edit
    #set_localrtist
    @localartist.youtubes.build
    @youtubes = @localartist.youtubes
  end

  def update
    #set_localrtist
    @localartist.save
    if @localartist.update(localartist_params)
      redirect_to localartist_path, notice: "情報を編集しました！"
    else
      render :edit
    end
  end

  def show
    #set_localrtist
    set_youtube
    @comments = @localartist.comments.all.order('created_at DESC')
    @comment = @localartist.comments.build
    #youtube api
    # @youtube_data = find_videos("#{@localartist.country} #{@localartist.name}")
    @favorite = current_user.favorites.find_by(localartist_id: @localartist.id)
  end

  def destroy
    @localartist.destroy
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users/registrations"
      redirect_to edit_user_registration_path(current_user.id), notice:"削除しました"
    else
      redirect_to localartists_path, notice:"削除しました"
    end
  end


  private

  def localartist_params
    params.require(:localartist).permit(:image,:image_cache, :name, :comment,:country, :post_comment, :tag_list, :who_list, :user_id, :youtube_url,youtubes_attributes:[:id, :localartist_id, :address, :_destroy])
  end

  def set_localartist
    @localartist = Localartist.find(params[:id])
  end

  def set_availables_tags_to_gon
      #自分の好きなアーティストと、全データのｱｰﾃｨｽﾄ名を入力保管候補として保存
      gon.available_tags = current_user.tag_list
      localartiststags = Localartist.pluck(:name)
      gon.available_tags.concat(localartiststags)
  end

  def set_localartist_tags_to_gon
      #edit時にあらかじめ登録したタグを表示する
      gon.localartist_tags = @localartist.tag_list
  end

  def set_youtube
    # url = params[:localartist][:youtubes][:address]
    # url = url.last(11)
    # @localartist.youtube_url = url
    @all = []
    if @localartist.youtubes.pluck("address").first.present?
      firstadd = @localartist.youtubes.pluck("address").first.last(11)
      @all << firstadd
    end
    if @localartist.youtubes.pluck("address").second.present?
      secondadd = @localartist.youtubes.pluck("address").second.last(11)
      @all << secondadd
    end
    if @localartist.youtubes.pluck("address").third.present?
      thirdadd = @localartist.youtubes.pluck("address").third.last(11)
      @all << thirdadd
    end

  end

end
