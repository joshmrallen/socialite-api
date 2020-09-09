class CreateJoinTableMessage < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.index [:sender_id, :receiver_id]
      t.index [:receiver_id, :sender_id]
      t.string :content
      t.bigint :sender_id
      t.bigint :receiver_id
      t.timestamps
    end
  end
end
