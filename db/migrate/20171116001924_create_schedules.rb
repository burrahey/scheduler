class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.boolean :published, default: false
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
