class WatchedEpisodesController < ApplicationController
  def create
    @episode = Episode.find(params[:episode])
    current_user.episodes << @episode unless current_user.episodes.exists?(@episodes)
    redirect_to :back
  end

  def destroy
    @episodes = Episode.find(params[:episode])
    current_user.episodes.destroy << @episode if current_user.episodes.exists?(@episodes)
    redirect_to :back
  end
end
