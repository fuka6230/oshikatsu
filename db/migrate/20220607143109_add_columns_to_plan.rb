class AddColumnsToPlan < ActiveRecord::Migration[7.0]
  def change
    rename_column :plans, :plan_at, :start_time
    add_column :plans, :end_time, :datetime
  end

  def up 
    execute 'DELETE FROM plans;'
    add_reference :plans, :user, null: false, index: true
  end
end
