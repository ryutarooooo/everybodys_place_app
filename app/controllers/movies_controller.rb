class MoviesController < ApplicationController
  PER = 8

  def index
    @movies = Movie.order(id: "asc").page(params[:page]).per(PER)
  end
end
