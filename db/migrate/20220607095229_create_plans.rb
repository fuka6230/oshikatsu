class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.datetime :plan_at
      t.string :tag

      t.timestamps
    end
  end
end
