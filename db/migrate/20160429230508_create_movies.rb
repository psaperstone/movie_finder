class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :genre
      t.string :actors
      t.decimal :metascore
      t.decimal :imdbscore
      t.decimal :user_rating

      t.timestamps null: false
    end
  end
end
