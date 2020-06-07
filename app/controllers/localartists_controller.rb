class LocalartistsController < ApplicationController


  def index
    @localartists = Localartist.all
  end

  def new
    @localartist = Localartist.new
  end

  def confirm
    @localartist = Localartist.new(localartist_params)
    @localartist.user.id = current_user.id
    render :new if @localartist.invalid?
  end

  def create
    @localartist = Localartist.new(localartist_params)
    @localartist.user_id = current_user.id
    redirect_to localartists_path
  end

  def show
    @localartist = Localartist.find(params[:id])
  end


  private

  def localartist_params
    params.require(:localartist).permit(:image, :name, :comment)
  end

end
