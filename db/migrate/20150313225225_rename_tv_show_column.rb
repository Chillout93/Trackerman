class RenameTvShowColumn < ActiveRecord::Migration
  def change
    rename_column :tv_shows, :season, :seasons
    change_column :tv_shows, :status, :string
  end
end
