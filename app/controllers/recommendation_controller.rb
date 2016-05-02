#
class RecommendationController < ApplicationController

  # # def new
  # #   abort
  # #   @recommendation = Recommendation.new
  # # end
  #
  # # def create
  # #   abort
  # #   @myvar = params[:fullname]
  # #   p @myvar
  # #   # render :index => "index"
  # #   # recommendation_actor = "Brad Pitt" name = params[:name]
  # #   # p recommendation_actor
  # # end
  #
  # def find_cast_members
  #    @search = Tmdb::Search.new
  #    @search.resource('person')                 # determines type of resource
  #    @search.query('samuel jackson')     # the query to search against
  #    actor = @search.fetch[0]['id']    # retrieve the actor/actress ID
  #    all_credits = Tmdb::Person.credits(actor)            # returns all credits info
  #    films_in = Tmdb::Person.credits(2231)['cast'][0]['title']  # iterate and capture this
  # end
  #
  # def film_appearances
  #   p @search = Tmdb::Search.new
  #   new_var = @search.resource('person')                 # determines type of resource
  #   newest_var = @search.query('will ferrell')     # the query to search against
  #   actor = @search.fetch[0]['id']    # retrieve the actor/actress ID
  #   all_credits = Tmdb::Person.credits(actor)            # returns all credits info
  #
  # # films_in = Tmdb::Person.credits(2231)['cast'][0]['title']  # iterate and capture this
  # # films_in = all_credits['cast'][0]['title']  # iterate and capture this
  #   newer_var = all_credits['cast']
  #   p newer_var
  #
  # ### GET EACH of those ACTOR/ACRESS FILMS RATING
  #   p @search = Tmdb::Search.new
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
