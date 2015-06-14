class AddOrgnizationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :orgnization, :string
  end
end
