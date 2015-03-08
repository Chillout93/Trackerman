class SearchController < ApplicationController
  def index
    @tv_show = Tmdb::TV.search(params[:query])
  end
end
