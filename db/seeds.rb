# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
             { :name => 'admin' },
             { :name => 'user' }
])
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :email => 'user@example.com', :password => 'toastons', :password_confirmation => 'toastons', :credits => 100000, :earnings => 0
puts 'New user VIP'
user2 = User.create! :email => 'user2@example.com', :password => 'toastons', :password_confirmation => 'toastons', :credits => 10, :earnings => 0
puts 'New user USER'
user.add_role :admin
user2.add_role :user
puts 'Roles added'

puts 'Creating players'
player1 = Player.create! :id_race => 2, :name => 'aLive', :first_name => 'Han', :last_name => 'Lee Seok', :photo_path => 'alive.jpg', :game => 'sc2', :country => 'South Korea'
player2 = Player.create! :id_race => 3, :name => 'First', :first_name => 'Kang', :last_name => 'Hyun Woo', :photo_path => 'first.jpg', :game => 'sc2', :country => 'South Korea'
player3 = Player.create! :id_race => 1, :name => 'Jaedong', :first_name => 'Lee', :last_name => 'Jae Dong', :photo_path => 'jaedong.jpg', :game => 'sc2', :country => 'South Korea'
player4 = Player.create! :id_race => 3, :name => 'NaNiwa', :first_name => 'Johan', :last_name => 'Lucchesi', :photo_path => 'naniwa.jpg', :game => 'sc2', :country => 'Sweden'
player5 = Player.create! :id_race => 2, :name => 'Taeja', :first_name => 'Yun', :last_name => 'Young Seo', :photo_path => 'taeja.jpg', :game => 'sc2', :country => 'South Korea'
player6 = Player.create! :id_race => 3, :name => 'Rain', :first_name => 'Jung', :last_name => 'Yoon Jong', :photo_path => 'rain.jpg', :game => 'sc2', :country => 'South Korea'
player7 = Player.create! :id_race => 2, :name => 'Bomber', :first_name => 'Choi', :last_name => 'Ji Sung', :photo_path => 'bomber.jpg', :game => 'sc2', :country => 'South Korea'
player8 = Player.create! :id_race => 1, :name => 'Scarlett', :first_name => 'Sasha', :last_name => 'Hostyn', :photo_path => 'scarlett.jpg', :game => 'sc2', :country => 'Canada'
puts 'Players created !'

puts 'Creating tournament'
tournament1 = Tournament.create! :name => 'WCS Season 2 Finals', :tournament_start => '2013-11-01', :tournament_end => '2013-11-15', :location => 'Germany', :nb_players => '8', :cash => '150000', :game => 'sc2', :tournament_type => 1
puts 'Tournament created !'

puts 'Creating rounds'
round1 = Round.create! :tournament => tournament1, :id_player_1 => '1', :id_player_2 => '2', :match => '0', :score_1 => '2', :score_2 => '3', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '1'
round2 = Round.create! :tournament => tournament1, :id_player_1 => '3', :id_player_2 => '4', :match => '1', :score_1 => '3', :score_2 => '1', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '2'
round3 = Round.create! :tournament => tournament1, :id_player_1 => '5', :id_player_2 => '6', :match => '2', :score_1 => '3', :score_2 => '0', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '0'
round4 = Round.create! :tournament => tournament1, :id_player_1 => '7', :id_player_2 => '8', :match => '3', :score_1 => '3', :score_2 => '2', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '0'
round5 = Round.create! :tournament => tournament1, :id_player_1 => '2', :id_player_2 => '3', :match => '4', :score_1 => '0', :score_2 => '3', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '0'
round6 = Round.create! :tournament => tournament1, :id_player_1 => '5', :id_player_2 => '7', :match => '5', :score_1 => '2', :score_2 => '3', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '0'
round7 = Round.create! :tournament => tournament1, :id_player_1 => '3', :id_player_2 => '7', :match => '6', :score_1 => '0', :score_2 => '4', :bet_id_1 => '50', :bet_id_2 => '50' , :highlighted => '0'
puts 'Rounds created'
