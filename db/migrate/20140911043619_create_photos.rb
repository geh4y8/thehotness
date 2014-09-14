class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :photo_choice
      t.string :name
    end
  end
end
