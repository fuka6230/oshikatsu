class ChangeImage < ActiveRecord::Migration[7.0]
  def change
    remove_column :memos, :image
  end
end
