class CreateJoinTableEmployeePreferences < ActiveRecord::Migration[5.1]
  create_table :employee_preferences do |t|
    t.integer :employee_id
    t.integer :preference_id
  end
end
