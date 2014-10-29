class Topic < ActiveRecord::Base

  belongs_to :user

  has_many :replies
  has_many :topic_groupships
  has_many :groups, :through => :topic_groupships
end
