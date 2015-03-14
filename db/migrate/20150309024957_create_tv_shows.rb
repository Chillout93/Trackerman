class CreateTvShows < ActiveRecord::Migration
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.string :created_by
      t.integer :season
      t.integer :episodes
      t.date :first_air_date
      t.date :last_air_date
      t.text :overview
      t.string :poster_path
      t.boolean :status
      t.float :rating
      t.integer :votes

      t.timestamps null: false
    end
  end
end
