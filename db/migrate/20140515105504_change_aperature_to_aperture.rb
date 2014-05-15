class ChangeAperatureToAperture < ActiveRecord::Migration

  def self.up
    rename_column :photos, :aperature, :aperture

  end
end
