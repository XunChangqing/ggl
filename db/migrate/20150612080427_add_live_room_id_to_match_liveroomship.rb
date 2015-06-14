class AddLiveRoomIdToMatchLiveroomship < ActiveRecord::Migration
  def change
    add_column :match_liveroomships, :live_room_id, :integer
    remove_column :match_liveroomships, :liveroom_id  
  end
end
