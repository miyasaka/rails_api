class DelAlbumColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :album, :string
  end
end
