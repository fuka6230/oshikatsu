class AddUserIdToTagMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :tag_memos, :user_id, :integer
  end
end
