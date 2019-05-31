class AddAlbumColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :album, :string
  end
end
