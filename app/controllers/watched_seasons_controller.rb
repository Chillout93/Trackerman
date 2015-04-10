class WatchedSeasonsController < ApplicationController
  def create
    @season = Season.find(params[:season])
    @season.episodes.each do |episode|
      current_user.episodes << episode unless current_user.episodes.exists?(episode)
    end
    current_user.seasons << @season unless current_user.seasons.exists?(@season)
    redirect_to :back
  end

  def destroy
    @season = Season.find(params[:season])
    current_user.seasons.destroy @season if current_user.seasons.exists?(@season)
    @season.episodes.each do |episode|
      current_user.episodes.destroy episode if current_user.episodes.exists?(episode)
    end
    redirect_to :back
  end
end
