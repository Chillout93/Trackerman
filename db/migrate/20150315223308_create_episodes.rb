class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :episode_number
      t.string :name
      t.date :air_date
      t.text :overview
      t.string :still_path
      t.float :vote_average
      t.integer :vote_count
      t.references :season, index: true

      t.timestamps null: false
    end
  end
end
