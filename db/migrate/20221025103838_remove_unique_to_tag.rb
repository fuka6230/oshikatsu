class RemoveUniqueToTag < ActiveRecord::Migration[7.0]
  def up
    remove_index :tags, :name
    add_index :tags, :name
  end

  def down
    remove_index :tags, :name
    add_index :tags, :name, unique: true
  end
end
