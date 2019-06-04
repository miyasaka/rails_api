class AddTurnColumnToMusiclibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :music_libraries, :turn, :integer
  end
end
