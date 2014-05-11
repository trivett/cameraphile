class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :camera
      t.integer :flickr_id
      t.string :photo_url
      t.string :title
      t.string :owner
      t.string :photopage #where it is on flickr
      #exif data
      t.string :camera_model
      t.string :camera_id
      t.string :focal_length
      t.string :exposure_time
      t.string :aperature
      t.string :iso_speed

    end
  end
end
