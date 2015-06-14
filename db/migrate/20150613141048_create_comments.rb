class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :content
      t.integer :match_id

      t.timestamps null: false
    end
  end
end
