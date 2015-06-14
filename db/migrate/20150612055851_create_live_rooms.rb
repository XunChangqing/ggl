class CreateLiveRooms < ActiveRecord::Migration
  def change
    create_table :live_rooms do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
