class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :tournament_start
      t.date :tournament_end
      t.text :description
      t.string :location
      t.integer :nb_players
      t.integer :cash
      t.text :game
      t.integer :tournament_type

      t.timestamps
    end
  end
end
