class CreateCommentTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_topics do |t|
      t.integer :user_id
      t.integer :topic_id
      t.text :comment


      t.timestamps
    end
  end
end
