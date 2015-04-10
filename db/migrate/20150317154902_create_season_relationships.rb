class CreateSeasonRelationships < ActiveRecord::Migration
  def change
    create_table :season_relationships do |t|

      t.timestamps null: false
    end
  end
end
