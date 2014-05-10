class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :brand
      t.string :model
      t.string :name
      t.string :type
      t.integer :price
      t.integer :megapixels
      t.string :memory_type
      t.string :image_url

    end
  end
end
