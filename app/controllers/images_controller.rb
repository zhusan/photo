#encoding:utf-8
class ImagesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:create, :add_flower]
  before_action :set_image, only: [:show, :edit, :update, :destroy, :add_flower]
  protect_from_forgery :except => [:create]
  skip_authorize_resource :only => [:add_flower]
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new
    @image.url = params[:pic]
    @image.album_id= params[:id]
    @image.file_name = params[:pic].original_filename
    respond_to do |format|
      if @image.save
        format.html {render json: {status: "success"}}
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  # put /images/add_flower/1
  def add_flower
    @image.add_flower
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:album_id, :note, :url, :file_name, :file_size)
    end
end
