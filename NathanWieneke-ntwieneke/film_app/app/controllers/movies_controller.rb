class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end
  def search
  	@movies_search = Movie.search(params{:q})
  end
  def new
  end
  def show
  end
  def edit
  end
end
