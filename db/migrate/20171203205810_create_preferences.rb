class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.integer :day
      t.string :desc

      t.timestamps
    end
  end
end
