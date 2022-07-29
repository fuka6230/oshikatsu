class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.string :name
      t.text :description
      t.string :tag
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
  def up 
    execute 'DELETE FROM memos;'
    add_reference :memos, :user, null: false, index: true
  end
end
