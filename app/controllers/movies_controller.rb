 class MoviesController < ApplicationController
  
  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    @movie = Movie.find(params[:id])
    @actor = @movie.actors.create(
      name: params[:name],
      age: params[:age],
    )
    redirect_to "/movies/#{@movie.id}"
  end 
 end