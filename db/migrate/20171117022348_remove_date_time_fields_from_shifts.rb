class RemoveDateTimeFieldsFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :start_date_time
    remove_column :shifts, :end_date_time
  end
end
