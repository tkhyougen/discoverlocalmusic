class SpotcommentsController < ApplicationController

    before_action :set_spot, only: [:create, :edit, :update]
    # before_action :set_comments, only: [:index, :create, :update, :destroy]


    def index
      @spotcomments = @spot.spotcomments.all.order('created_at DESC')
      binding.pry
    end

    def create
    #set_spot
    #@spotのidをspot_idにあらかじめいれた状態でspotcommentのinstanceを作成できる
      @spotcomment = @spot.spotcomments.build(comment_params)
      @spotcomment.user_id = current_user.id

      respond_to do |format|
        if @spotcomment.save
          format.js { render :index }
        else
          format.html { redirect_to spot_path(@spot), notice:"投稿できません"}
        end
      end
    end

    def edit
      @spotcomment = @spot.spotcomments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'コメントの編集中'
        format.js { render :edit }
      end
    end


    def update
      @spotcomment = @spot.spotcomments.find(params[:id])
      respond_to do |format|
        if @spotcomment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
    end

    def destroy
      @spotcomment = Spotcomment.find(params[:id])
      @spotcomment.destroy
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
    end


    private

    def comment_params
      params.require(:spotcomment).permit(:spot_id, :content)
    end

      # spotをパラメータの値から探し出し,spotに紐づくcommentsとしてbuild
    def set_spot
      @spot = Spot.find(params[:spot_id])
    end

    # def set_comments
    #   @comment = @localartist.comments.includes([:user]).order(id: :desc)
    # end
end
