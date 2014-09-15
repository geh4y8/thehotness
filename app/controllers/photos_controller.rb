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
      photo_url = "/photos/#{@photo.id}"
      render :js => "window.location.pathname='#{photo_url}'"
      #redirect_to :action => "show", :id => @photo.id
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
