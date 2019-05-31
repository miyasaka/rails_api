class ModColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :system_used, :string
  end
  def change
    add_column :music_libraries, :music_file, :string
  end
end
