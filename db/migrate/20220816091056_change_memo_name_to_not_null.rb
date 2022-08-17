class ChangeMemoNameToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memos, :name, false
  end
end
