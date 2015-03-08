class TvShowController < ApplicationController
  def show
    @tv_show = Tmdb::TV.detail(params[:id])
    @poster_path = @tv_show["poster_path"]
  end
end
