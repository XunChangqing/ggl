class AddTimeIndexToMatches < ActiveRecord::Migration
  def change
    add_index :matches, :time
  end
end
