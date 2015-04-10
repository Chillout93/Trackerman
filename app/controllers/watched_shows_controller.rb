class WatchedShowsController < ApplicationController
  def create
    @tv_show = TvShow.find(params[:tv_show])
    current_user.tv_shows << @tv_show unless current_user.tv_shows.exists?(@tv_show)
      
    TvShowRelationship.find_by(user_id: current_user, tv_show_id: @tv_show).toggle_watch_show

    redirect_to :back
  end
end
