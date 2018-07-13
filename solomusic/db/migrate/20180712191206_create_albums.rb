class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null:false
      t.string :title, null:false
      t.integer :yr, null:false
      t.boolean :studio, null:false

      t.timestamps
    end
  end
end
