class TvShowController < ApplicationController
  def show
    @tv_show = Tmdb::TV.detail(params[:id])
     @movie = Tmdb::Movie.detail(params[:id])
  end
end
