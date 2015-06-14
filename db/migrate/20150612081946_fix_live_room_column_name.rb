class FixLiveRoomColumnName < ActiveRecord::Migration
  def change
    rename_column :live_rooms, :title, :provider
  end
end
