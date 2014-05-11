class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :brand
      t.string :model
      t.string :name
      t.string :type
      t.integer :price
      t.string :megapixels
      t.string :memory_type
      t.string :small_image_url
      t.string :large_image_url
      t.string :lcd_screen_size

    end
  end
end
