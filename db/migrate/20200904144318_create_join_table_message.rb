class CreateJoinTableMessage < ActiveRecord::Migration[6.0]
  def change
    create_join_table :senders, :receivers, table_name: :messages do |t|
      t.index [:sender_id, :receiver_id]
      t.index [:receiver_id, :sender_id]
      t.string :content
      t.timestamps
    end
  end
end
