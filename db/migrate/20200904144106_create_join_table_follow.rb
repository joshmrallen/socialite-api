class CreateJoinTableFollow < ActiveRecord::Migration[6.0]
  def change
    create_join_table :followers, :followees, table_name: :follows do |t|
      t.index [:follower_id, :followee_id]
      t.index [:followee_id, :follower_id]
      t.timestamps
    end
  end
end
