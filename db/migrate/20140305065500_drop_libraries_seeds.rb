class DropLibrariesSeeds < ActiveRecord::Migration
  def up
    drop_table :libraries_seeds
  end

  def down
    create_join_table :libraries, :seeds do |t|
      t.index [:library_id, :seed_id]
      t.index [:seed_id, :library_id]

      t.timestamps
    end
  end
end
