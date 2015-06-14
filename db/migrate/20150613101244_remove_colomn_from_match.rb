class RemoveColomnFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :status
    remove_column :matches, :url
    remove_column :matches, :winner_id
  end
end
