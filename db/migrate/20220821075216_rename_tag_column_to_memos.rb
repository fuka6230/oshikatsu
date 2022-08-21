class RenameTagColumnToMemos < ActiveRecord::Migration[7.0]
  def change
    rename_column :memos, :tag, :tag_memo
  end
end
