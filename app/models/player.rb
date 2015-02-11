class Player < ActiveRecord::Base
  extend Enumerize

  enumerize :game, in: [:lol, :sc2]
  enumerize :id_race, in: [1, 2, 3]

  validates     :name, :presence => true
  validates     :first_name, :presence => true
  validates     :last_name, :presence => true
  validates     :photo_path, :presence => true
  validates     :game, :presence => true
  validates     :country, :presence => true

end
