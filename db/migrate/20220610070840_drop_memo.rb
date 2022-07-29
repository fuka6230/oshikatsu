class DropMemo < ActiveRecord::Migration[7.0]
  def change
  drop_table :memos
  end
end
