class CreateTagMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_memos do |t|
      t.string :name, null: false

      t.timestamps
      t.index :name, unique: true
    end
  end
end
