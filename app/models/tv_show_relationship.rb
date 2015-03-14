class TvShowRelationship < ActiveRecord::Base
  belongs_to :tv_show
  belongs_to :user
end
