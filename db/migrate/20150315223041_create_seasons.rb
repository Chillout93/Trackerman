class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :season_number
      t.string :name
      t.date :air_date
      t.text :overview
      t.string :poster_path
      t.references :tv_show, index: true

      t.timestamps null: false
    end
  end
end
