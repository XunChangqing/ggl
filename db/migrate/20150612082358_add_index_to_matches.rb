class AddIndexToMatches < ActiveRecord::Migration
  def change
    add_index :matches, :status
  end
end
