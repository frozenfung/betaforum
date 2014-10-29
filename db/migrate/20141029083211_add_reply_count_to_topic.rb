class AddReplyCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :reply_count, :integer
  end
end
