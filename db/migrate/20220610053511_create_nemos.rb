class CreateNemos < ActiveRecord::Migration[7.0]
  def change
    create_table :nemos do |t|
      t.string :title
      t.string :description
      t.string :text
      t.string :image
      t.string :tag

      t.timestamps
    end
  end
end
