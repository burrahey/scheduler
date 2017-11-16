class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
