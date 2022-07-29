class ChangeTagformemosToTagmemos < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM tag_memos;'
    add_reference :tag_memos, :user, null: false, index: true
  end

  def down
    remove_reference :tag_memos, :user, index: true
  end
end
