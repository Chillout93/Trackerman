class TrackedShowsController < ApplicationController
  def create
    tv_show = TvShow.find(params[:id])
    if current_user.tv_shows(tv_show)
      # Invert tracking using !
    else
      # Insert a new relationship then change tracking to true 
      redirect_to :back
    end
  end
end
