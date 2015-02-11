class Round < ActiveRecord::Base
  extend Enumerize

  belongs_to :tournament
  belongs_to :player

  enumerize :highlighted, in: [0, 1, 2]

  validates     :tournament, :presence => true
  validates     :id_player_1, :presence => true
  validates     :id_player_2, :presence => true
  validates     :match, :presence => true
  validates     :bet_id_1, :presence => true
  validates     :bet_id_2, :presence => true
  validates     :highlighted, :presence => true
end
