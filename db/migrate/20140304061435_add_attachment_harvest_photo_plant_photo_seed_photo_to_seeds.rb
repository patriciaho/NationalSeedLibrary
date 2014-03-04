class AddAttachmentHarvestPhotoPlantPhotoSeedPhotoToSeeds < ActiveRecord::Migration
  def self.up
    change_table :seeds do |t|
      t.attachment :harvest_photo
      t.attachment :plant_photo
      t.attachment :seed_photo
    end
  end

  def self.down
    drop_attached_file :seeds, :harvest_photo
    drop_attached_file :seeds, :plant_photo
    drop_attached_file :seeds, :seed_photo
  end
end
