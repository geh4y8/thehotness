class HeadshotPhotosController < ApplicationController
  helper :headshot

  def new
    @headshot_photo = HeadshotPhoto.new
  end

  def create
    @headshot_photo = HeadshotPhoto.new(headshot_params)
    if @headshot_photo.save
      redirect_to headshot_photo_path(@headshot_photo)
    else
      render 'new'
    end
  end
end
