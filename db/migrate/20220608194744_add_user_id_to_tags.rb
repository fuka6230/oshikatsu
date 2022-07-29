
class AddUserIdToTags < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM tags;'
    add_reference :tags, :user, null: false, index: true
  end

  def down
    remove_reference :tags, :user, index: true
  end
end
