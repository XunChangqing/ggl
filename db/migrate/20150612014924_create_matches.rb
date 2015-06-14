class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :time
      t.string :status
      t.string :url
      t.integer :event_id
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winner_id
      t.text :intro

      t.timestamps null: false
    end
  end
end
