class CreateJoinTableLibrarySeed < ActiveRecord::Migration
  def change
    create_join_table :libraries, :seeds do |t|
      # t.index [:library_id, :seed_id]
      # t.index [:seed_id, :library_id]
    end
  end
end
