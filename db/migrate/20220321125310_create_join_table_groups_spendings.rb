class CreateJoinTableGroupsSpendings < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :spendings do |t|
      t.index %i[group_id spending_id]
      t.timestamps
    end
  end
end
