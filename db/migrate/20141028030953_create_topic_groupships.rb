class CreateTopicGroupships < ActiveRecord::Migration
  def change
    create_table :topic_groupships do |t|
      t.integer :topic_id
      t.integer :group_id

      t.timestamps
    end
  end
end
