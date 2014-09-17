class PhotosController < ApplicationController
  def index

  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      photo_url = "/photos/#{@photo.id}"
      render :js => "window.location.pathname='#{photo_url}'"
    else
      render'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @result = @photo.identify
    if @result["face_detection"] != []
      gon.beauty =  ((@result["face_detection"].first["beauty"]).to_f * 100).round(0)
      gon.race_percentage = (@result["face_detection"].first["race"].first[1] * 100).round(0)
      gon.age = @result["face_detection"].first["age"]
      @race = @result["face_detection"].first["race"].first[0]
      @emotion_names =[]
      @emotion_values = []
      @result["face_detection"].first["emotion"].each do |k,v|
        @emotion_names << k
        @emotion_values << v
      end
      gon.emotion1value = (@emotion_values[0] *100).round(0)
      gon.emotion2value = (@emotion_values[1] *100).round(0)
      gon.emotion3value = (@emotion_values[2] *100).round(0)
    else
      flash[:notice] = "No Face Recognized"
      render'new'

    end
  end

  def edit

  end

  private

  def photo_params
    params.require(:photo).permit(:photo_choice, :name, :photo_url)
  end
end
