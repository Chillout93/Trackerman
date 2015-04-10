class CalendarController < ApplicationController
  def index
    @episodes = Episode.where(:air_date => Date.today.beginning_of_week..Date.today.end_of_week)

    @sunday = Array.new
    @monday = Array.new
    @tuesday = Array.new
    @wednesday = Array.new
    @thursday = Array.new
    @friday = Array.new
    @saturday = Array.new

    @episodes.each do |episode|
      case episode.air_date.wday
        when 0 # Sunday
          @sunday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 1 # Monday
          @monday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 2 # Tuesday
          @tuesday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 3 # Wednesday
          @wednesday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 4 # Thursday
          @thursday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 5 # Friday
          @friday <<  [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
        when 6 # Saturday
          @saturday << [episode.season.tv_show, episode.season.season_number, episode.episode_number, episode.name]
      end
    end
  end
end
