class AddStartAndEndDateToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :start_date, :date
    add_column :schedules, :end_date, :date
  end
end
