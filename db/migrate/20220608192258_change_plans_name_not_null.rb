class ChangePlansNameNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :plans, :name, false
  end
end
