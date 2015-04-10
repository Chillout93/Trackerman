class TvShow < ActiveRecord::Base
  has_many :tv_show_relationships
  has_many :users, :through => :tv_show_relationships
  has_many :seasons
  has_many :episodes

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def tracked?(current_user)
    tv_show_relationship = self.tv_show_relationships.where(user_id: current_user).first
    tv_show_relationship ? tv_show_relationship.tracked == true : false
  end

  def watched?(current_user)
    tv_show_relationship = self.tv_show_relationships.where(user_id: current_user).first
    tv_show_relationship ? tv_show_relationship.watched == true : false
  end

  def latest_episode(current_user)
    @latest_episode = nil 
            
    self.seasons.reverse.each do |season| 
      season.episodes.reverse.each do |episode|
        @latest_episode = episode unless episode.watched?(current_user)
      end
    end

    @latest_episode = self.seasons.first.episodes.first if @latest_episode.nil?
    return @latest_episode
  end
end
