class Movie < ActiveRecord::Base
  belongs_to :user
  # def givekey
  #   https://api.themoviedb.org/3/movie/550?api_key=801b53387d0c23080402f03d459e729f
  # end

end
