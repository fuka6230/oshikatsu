class RemoveTagMemoIdFromMemos < ActiveRecord::Migration[7.0]
  def up
    remove_column :memos, :tag_memo_id
  end

  def down
    add_column :memos, :tag_memo_id, :integer
  end
end
