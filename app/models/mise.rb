class Mise < ActiveRecord::Base
  validates     :amount, :presence => true
  validates     :match_id, :presence => true
  validates     :player_id, :presence => true
  validates     :user_id, :presence => true
end
