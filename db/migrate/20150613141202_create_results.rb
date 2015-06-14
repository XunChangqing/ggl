class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :match_id
      t.integer :player1_score
      t.integer :player2_score
      t.text :description
      t.string :videourl

      t.timestamps null: false
    end
  end
end
