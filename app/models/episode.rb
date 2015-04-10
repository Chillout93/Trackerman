class Episode < ActiveRecord::Base
  belongs_to :season

  has_many :episode_relationships
  has_many :users, :through => :episode_relationships

  def watched?(current_user)
    self.users.exists?(current_user)
  end
end
