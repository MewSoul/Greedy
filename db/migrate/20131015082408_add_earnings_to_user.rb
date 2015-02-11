class AddEarningsToUser < ActiveRecord::Migration
  def change
    add_column :users, :earnings, :integer
  end
end
