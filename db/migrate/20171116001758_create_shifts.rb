class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.boolean :published
      t.references :channel, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
