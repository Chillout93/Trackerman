class EpisodeRelationship < ActiveRecord::Base
  belongs_to :episode
  belongs_to :user

  def toggle_watch_episode
    update_attribute(:watched, !self.watched)
  end
end
