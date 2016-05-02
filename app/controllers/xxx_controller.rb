class XxxController < ApplicationController
  attr_accessor :actor

  def initialize
    @actor = actor
  end

  def index
  end

  def new # this GETs a new form
    @recommendation = Recommendation.new
  end

  # def show
  #   # @myvar = 'will ferrell'            #####  MANUAL INPUT - WANT THIS FROM THE FORM !!!!
  #   @myvar = params[:fullname]       # GOING TO NEED THIS
  #   find_cast_members
  # end

  def find_cast_members
     @search = Tmdb::Search.new
     @search.resource('person')                         # determines type of resource
     @search.query(@myvar)                              # the query to search against
     @actor = @search.fetch[0]['id']                    # retrieve the actor/actress ID
     all_credits = Tmdb::Person.credits(actor)['cast']  # returns all credits info

     films_in = []

     all_credits.each do |film|
       @search = Tmdb::Search.new
       @search.resource('movie')                    # determines type of resource
       @search.query(film['title'])                 # the query to search against
       puts "+-+" * 30
       x = @search.fetch
       puts "#{film['title']} results: #{x}"
       puts "+-+" * 30
       rating = @search.fetch[0]['vote_average']    # retrieve the movie rating
       if film['title'].nil?
         next
       else
         films_in << [film['title'],rating]     # insert each of the actors films & rating into the array
         p "THE MULTI-DIMEMSIONAL ARRAY IS BUILDING............."
         p films_in
       end
     end

     def show
       # @myvar = 'will ferrell'            #####  MANUAL INPUT - WANT THIS FROM THE FORM !!!!
       @myvar = params[:fullname]       # GOING TO NEED THIS
       find_cast_members
     end

    #  p "FINISH - HERE IS THE FINAL ARRAY"
    #  p films_in
    #  film_appearances
  end

# films_in[0][0]
# Movie.where(actors: 'will ferrell')

# Movie.first.actors # returns a string
# Movie.first.actors.split(', ')          # converts each name to array values, now look for actor
# Movie.first.actors.split(', ').include?("Jodie Foster")
# Movie.where(title: 'Old School').pluck(:actors)
# Movie.where(title: 'Old School').pluck(:actors)[0].split(', ')     # returns names in array
# Movie.where(title: 'Old School').pluck(:actors)[0].split(', ').include?("Will Ferrell")


  # def film_appearances
  # #   p "$"*44
  # #   p @myvar
  # #   @search = Tmdb::Search.new
  # #   new_var = @search.resource('person')    # determines type of resource
  # #   newest_var = @search.query(@myvar)      # the query to search against
  # #   actor = @search.fetch[0]['id']          # retrieve the actor/actress ID
  # #   all_credits = Tmdb::Person.credits(actor) # returns all credits info
  # #
  # # # films_in = Tmdb::Person.credits(2231)['cast'][0]['title']  # iterate and capture this
  # # # films_in = all_credits['cast'][0]['title']  # iterate and capture this
  # #   newer_var = all_credits['cast']
  # #   p newer_var
  #
  # ### GET EACH of those ACTOR/ACRESS FILMS RATING
  #   @search = Tmdb::Search.new
  #   new_rating_var = @search.resource('movie')                 # determines type of resource
  #   newest_rating_var = @search.query('Step Brothers')     # the query to search against
  #   rating = @search.fetch[0]['vote_average']    # retrieve the movie rating
  #
  #   @film_appearances = []
  #
  #   newer_var.each do |film|
  #   @film_appearances << film['title']
  #   end
  #
  #   p @film_appearances.compact
  #   # @film_appearances = @film_appearances#.compact.join(', ')
  # end
end
