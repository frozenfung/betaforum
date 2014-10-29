class Group < ActiveRecord::Base
  has_many :topic_groupships
  has_many :topics, :through => :topic_groupships
end
