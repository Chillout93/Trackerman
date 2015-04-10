class SeasonRelationship < ActiveRecord::Base
  belongs_to :season
  belongs_to :user
  
  def toggle_watch_season
    update_attribute(:watched, !self.watched)
  end
end
