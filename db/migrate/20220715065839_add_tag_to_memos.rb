class AddTagToMemos < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM memos;'
    add_reference :memos, :tag_memo, null: false, index: true
  end

  def down
    remove_reference :memos, :tag, index: true
  end
end
