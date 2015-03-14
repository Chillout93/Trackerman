class RenameTrackOrWatched < ActiveRecord::Migration
  def change
    rename_table :track_or_watched, :tv_show_relationships
  end
end
