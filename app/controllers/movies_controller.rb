class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.where(user_id: current_user.id)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

      movie_id = Tmdb::Movie.find(@movie.title)[0].id

      title_info_2 = Tmdb::Movie.detail(movie_id)
      genre = title_info_2['genres'][0]['name']
      vote = title_info_2['vote_average']
      year = title_info_2['release_date'].byteslice(0,4)

      cast = Tmdb::Movie.casts(movie_id)
      cast_members = []

      cast.each do |member|
      cast_members << member['name']
      end

      @movie.actors = cast_members.join(', ')
      @movie.genre = genre
      @movie.year = year
      @movie.metascore = vote
      @movie.user_id = current_user.id

    respond_to do |format|
    if @movie.save
      format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
      format.json { render :show, status: :created, location: @movie }
    else
      format.html { render :new }
      format.json { render json: @movie.errors, status: :unprocessable_entity }
    end
    end
  end








  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year, :genre, :actors, :metascore, :imdbscore, :user_rating)
    end
end
