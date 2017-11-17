class DropChannels < ActiveRecord::Migration[5.1]
  def change
    drop_table :channels
  end
end
