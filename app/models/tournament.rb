class Tournament < ActiveRecord::Base
  extend Enumerize

  has_many :rounds

  enumerize :game, in: [:lol, :sc2]

  validates     :name, :presence => true
  validates     :tournament_start, :presence => true
  validates     :tournament_end, :presence => true
  validates     :location, :presence => true
  validates     :nb_players, :presence => true
  validates     :cash, :presence => true
  validates     :game, :presence => true
  validates     :tournament_type, :presence => true
end
