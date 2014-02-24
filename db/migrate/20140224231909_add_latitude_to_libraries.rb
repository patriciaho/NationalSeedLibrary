class AddLatitudeToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :latitude, :float
  end
end
