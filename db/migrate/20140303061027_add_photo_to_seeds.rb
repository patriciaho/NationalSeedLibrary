class AddPhotoToSeeds < ActiveRecord::Migration
  def change
    add_column :seeds, :photo, :string
  end
end
