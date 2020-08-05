class MoviesController < ApplicationController
  PER = 8

  def index
    if params[:categroy].present?
      @movies = Movie.where(category: params[:category]).order(id: "asc").page(params[:page]).per(PER)
    else
      @movies = Movie.order(id: "asc").page(params[:page]).per(PER)
    end
  end
end
