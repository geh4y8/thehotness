class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @result = @photo.identify
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_choice, :name, :photo_url)
  end
end
