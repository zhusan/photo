class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :title_page_id
      t.integer :user_id
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
