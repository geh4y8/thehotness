class HeadshotPhotosController < ApplicationController
  helper :headshot

  def new
    @headshot_photo = HeadshotPhoto.new
  end

  def create
    @headshot_photo = HeadshotPhoto.new(headshot_params)
    @headshot_photo.image = URI.parse(HeadshotPhoto.last.url)
    if @headshot_photo.save
      redirect_to headshot_photo_path(@headshot_photo)
    else
      render 'new'
    end
  end

  def headshot_params
    params.require(:headshot_photo).permit(:image, :description)
  end
end
