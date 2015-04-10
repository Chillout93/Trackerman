class CreateEpisodeRelationships < ActiveRecord::Migration
  def change
    create_table :episode_relationships do |t|

      t.timestamps null: false
    end
  end
end
