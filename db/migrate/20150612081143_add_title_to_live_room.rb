class AddTitleToLiveRoom < ActiveRecord::Migration
  def change
    add_column :live_rooms, :title, :string
  end
end
