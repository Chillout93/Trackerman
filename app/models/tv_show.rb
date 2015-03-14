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
end
