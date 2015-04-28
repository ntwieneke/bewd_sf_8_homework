class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :search, :edit]

  def index
  	@movies = Movie.all
  end
  def search
  	@movies_search = Movie.search(params{:q})
  end
  def new
  	@movie = Movie.new
  end
  def show
  end
  def edit
  end
  def create
    @movie = Movie.new(movie_params)

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
  private 
  	def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :year, :description)
    end
end
