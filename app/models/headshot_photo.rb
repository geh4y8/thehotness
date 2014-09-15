require 'open-uri'

class HeadshotPhoto < ActiveRecord::Base

  belongs_to :capturable, :polymorphic => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def picture_from_url(url)
    self.image = URI.parse(url)
  end


  def headshot_post_save(file_path)
    @headshot_photo = HeadshotPhoto.new
    @headshot_photo.image = File.new(file_path)
    @headshot_photo.save
  end
end
