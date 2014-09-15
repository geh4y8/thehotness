

class Photo < ActiveRecord::Base

  has_attached_file :photo_choice, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default => ":rails_root/public/system/photos/no-image-available.png",
  :url => ":rails_root/public/photos/images/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo_choice, :content_type => /\Aimage\/.*\Z/


  after_create :identify

  def picture_from_url(url)
    self.photo_choice = URI.parse(url)
  end

  def identify
    begin
      # Cloudinary::Uploader.upload(photo_choice.url)
      client = Rekognize::Client::Base.new(
        api_key: 'd27krKEkBgGMGkSs',
        api_secret: 'pfPCSFmsLPJtpU6t')
      client.face_recognize(
          urls: self.photo_url,
          jobs: 'face_age face_beauty face_race face_emotion face_gender')
    end
  end

 def photo_choice_url
    JSON.parse("/Users/Guy/Documents/epicodus/doppelganger/public/system/photos/photo_choices/000/000/001/medium/bar.jpeg")
end

end
