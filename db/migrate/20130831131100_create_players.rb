class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :id_race
      t.integer :id_team
      t.string :name
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :photo_path
      t.string :game
      t.string :country
      
      t.timestamps
    end
  end
end
