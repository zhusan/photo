class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @q = Album.order("created_at desc").search(params[:q])
    @albums = @q.result(distinct: true).paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @album = Album.new
    respond_to do |format|
      format.js
    end
  end

  def edit
    @album = Album.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @album = Album.new(album_param)
    @album.user_id = current_user.id
    respond_to do |format|
      if @album.save
        format.js
      else
        format.json { render json: @crm_deal_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(album_param)
        format.js 
      else
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album= Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.js
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def album_param
    params.require(:album).permit(:name, :note, :title_page_id)
  end

end
