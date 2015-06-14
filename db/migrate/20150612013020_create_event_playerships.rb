class CreateEventPlayerships < ActiveRecord::Migration
  def change
    create_table :event_playerships do |t|
      t.integer :event_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
