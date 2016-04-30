class AddMovieToUser < ActiveRecord::Migration
  def change
    add_reference :users, :movie, index: true, foreign_key: true
  end
end
