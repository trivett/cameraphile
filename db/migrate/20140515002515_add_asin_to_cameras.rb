class AddAsinToCameras < ActiveRecord::Migration
  def change
    change_table :cameras do |t|
      t.string :asin
    end
  end
end

