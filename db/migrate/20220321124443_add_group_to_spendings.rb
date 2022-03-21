class AddGroupToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :spendings, :group, null:false, foreign_key: true
  end
end
