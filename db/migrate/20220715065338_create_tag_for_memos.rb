class CreateTagForMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_for_memos do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
