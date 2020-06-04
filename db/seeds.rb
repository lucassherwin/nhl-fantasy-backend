# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
League.destroy_all
# Team.destroy_all
# Player.destroy_all
# AddUserToLeague.destroy_all

user1 = User.create(name: 'user1', rank: 'gold')
user2 = User.create(name: 'user2', rank: 'silver')

league1 = League.create!(userID: user1.id, name: 'test league')

# league = [
#     {
#         userID: user1,
#         name: 'test league'
#     }
# ]

# league.each do |l|
#     League.create(l)
# end


# team1 = Team.create!(leagueID: league1.id, userID: user1.id, name: 'Terriers')

# player1 = Player.create!(teamID: team1.id, playerID: 123)

# addUserToLeague1 = AddUserToLeague.create!(userID: user1.id, leagueID: league1.id)