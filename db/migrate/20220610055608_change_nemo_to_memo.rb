class ChangeNemoToMemo < ActiveRecord::Migration[7.0]
  def change
    rename_table :nemos, :memos
  end
end
