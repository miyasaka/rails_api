class CreateMusicLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :music_libraries do |t|
      t.integer :user_id
      t.string :title
      t.string :words_by
      t.string :music_by
      t.date :released

      t.timestamps
    end
  end
end
