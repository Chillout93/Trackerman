class AddRelationshipFields < ActiveRecord::Migration
  def change
    add_column :episode_relationships, :user_id, :integer
    add_column :episode_relationships, :episode_id, :integer

    add_column :season_relationships, :user_id, :integer
    add_column :season_relationships, :season_id, :integer
  end
end
