class AddCategoriesToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :category
    end
  end
end
