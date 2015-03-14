class RenameTvShowRelationship < ActiveRecord::Migration
  def change
    rename_table :tv_show_relationship, :tv_show_relationships
  end
end
