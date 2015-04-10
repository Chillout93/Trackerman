class RenameSeasonsAndEpisodes < ActiveRecord::Migration
  def change
    rename_column :tv_shows, :seasons, :no_of_seasons
    rename_column :tv_shows, :episodes, :no_of_episodes
  end
end
