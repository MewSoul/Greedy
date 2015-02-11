class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :tournament_id
      t.integer :id_player_1
      t.integer :id_player_2
      t.integer :match
      t.integer :score_1
      t.integer :score_2
      t.integer :bet_id_1
      t.integer :bet_id_2
      t.integer :highlighted

      t.timestamps
    end
  end
end
