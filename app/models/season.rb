class Season < ActiveRecord::Base
  belongs_to :tv_show
  has_many :episodes

  has_many :season_relationships
  has_many :users, :through => :season_relationships

  def watched?(current_user)
    self.users.exists?(current_user)
  end
end
