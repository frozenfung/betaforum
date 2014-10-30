class AddDefaultToReplyCount < ActiveRecord::Migration
  def change
    change_column :topics, :reply_count, :integer, :default => 0
  end
end
