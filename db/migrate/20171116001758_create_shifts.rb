class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :published, default: false
      t.references :employee, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
