class CreateMises < ActiveRecord::Migration
  def change
    create_table :mises do |t|
      t.integer :amount
      t.integer :match_id
      t.integer :player_id
      t.integer :user_id
      t.boolean :victory
      t.integer :gain

      t.timestamps
    end
  end
end
