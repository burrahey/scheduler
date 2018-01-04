class ChangeColumnInSchedulesAndShifts < ActiveRecord::Migration[5.1]
  def change
    change_column :shifts, :date, :datetime
    change_column :shifts, :start_time, :datetime
    change_column :shifts, :end_time, :datetime
    change_column :schedules, :start_date, :datetime
    change_column :schedules, :end_date, :datetime
  end
end
