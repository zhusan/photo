class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :album_id
      t.integer :user_id
      t.string :note
      t.string :url
      t.string :file_name
      t.integer :file_size

      t.timestamps
    end
  end
end
