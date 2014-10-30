class TopicGroupship < ActiveRecord::Base
  belongs_to :group
  belongs_to :topic
end
