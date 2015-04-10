class TvShowRelationship < ActiveRecord::Base
  belongs_to :tv_show
  belongs_to :user

  def toggle_track_show
    update_attribute(:tracked, !self.tracked)
  end

  def toggle_watch_show
    update_attribute(:watched, !self.watched)
  end
end
