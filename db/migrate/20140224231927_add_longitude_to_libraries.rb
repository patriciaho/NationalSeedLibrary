class AddLongitudeToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :longitude, :float
  end
end
