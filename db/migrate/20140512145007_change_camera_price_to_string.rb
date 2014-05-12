class ChangeCameraPriceToString < ActiveRecord::Migration
  def change
    change_table :cameras do |t|
      t.remove :price
      t.string :price
    end
  end
end

