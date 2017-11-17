class RemoveChannelIdFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :channel_id
  end
end
