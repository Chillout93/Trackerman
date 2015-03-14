class CreateTrackOrWatched < ActiveRecord::Migration
  def change
    create_table :track_or_watched do |t|
      t.integer :tv_show_id, :null => false
      t.integer :user_id, :null => false
      t.boolean :tracked, default: false
      t.boolean :watched, default: false

      t.timestamps null: false
    end
  end
end
