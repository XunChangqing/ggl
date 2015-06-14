class CreateMatchLiveroomships < ActiveRecord::Migration
  def change
    create_table :match_liveroomships do |t|
      t.integer :match_id
      t.integer :liveroom_id

      t.timestamps null: false
    end
  end
end
