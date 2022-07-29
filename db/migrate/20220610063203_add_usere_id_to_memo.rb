class AddUsereIdToMemo < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM memos;'
    add_reference :memos, :user, index: true
  end

  def down
    remove_reference :memos, :user, index: true
  end

end
