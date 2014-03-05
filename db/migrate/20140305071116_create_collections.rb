class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :library, index: true
      t.references :seed, index: true

      t.timestamps
    end
  end
end
