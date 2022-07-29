class AddUserIdToPlans < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM plans;'
    add_reference :plans, :user, null: false, index: true
  end
end
