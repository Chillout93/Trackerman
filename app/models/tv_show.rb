class TvShow < ActiveRecord::Base
  has_many :tv_show_relationships
  has_many :users, :through => :tv_show_relationships

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
    self.tv_show_relationships.where(user_id: current_user).first.watched == true
  end
end
