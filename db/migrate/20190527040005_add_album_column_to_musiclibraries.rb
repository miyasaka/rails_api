class AddAlbumColumnToMusiclibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :music_libraries, :album, :string
  end
end
