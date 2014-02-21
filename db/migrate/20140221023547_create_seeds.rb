class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :planting_season
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
