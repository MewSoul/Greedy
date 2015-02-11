class AddFieldsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :can_bet, :boolean
    add_column :rounds, :bet_distributed, :boolean
  end
end
