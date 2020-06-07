require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
League.destroy_all
Team.destroy_all
Player.destroy_all
AddUserToLeague.destroy_all

user1 = User.create(name: 'user1', rank: 'gold')
user2 = User.create(name: 'user2', rank: 'silver')

league1 = League.create(user: user1, name: 'test league')

team1 = Team.create(league: league1, user: user1, name: 'Terriers')

# player1 = Player.create(team: team1, playerID: 123)

addUserToLeague1 = AddUserToLeague.create(user: user1, league: league1)

unparsed_data = RestClient.get("https://statsapi.web.nhl.com/api/v1/teams/6/roster")
parsed_data = JSON.parse(unparsed_data)
# puts parsed_data

#loops over roster and fills in information for each player
#eventually expand to loop over each team -> each roster -> each player
# idArr = []
parsed_data["roster"].each do |person|
    #get specific player information 
    #CURRENT SEASON ONLY
    # idArr << person["person"]["id"]
    playerID = person["person"]["id"]
    playerName = person["person"]["fullName"]

    unparsed_player_data = RestClient.get("https://statsapi.web.nhl.com/api/v1/people/#{playerID}/stats?stats=statsSingleSeason&season=20192020")
    parsed_player_data = JSON.parse(unparsed_player_data)
    
    playerGoals = 0
    if(parsed_player_data["stats"][0]["splits"][0] == nil)
        #kevan miller exception
        #out for season no goals
        playerGoals = 0
    elsif(parsed_player_data["stats"][0]["splits"][0]["stat"]["goals"] == nil)
        #goalie exception
        playerGoals = nil
        #fill in goalie information
    else
        playerGoals = parsed_player_data["stats"][0]["splits"][0]["stat"]["goals"]
        playerAssts = parsed_player_data["stats"][0]["splits"][0]["stat"]["assists"]
        playerPPG = parsed_player_data["stats"][0]["splits"][0]["stat"]["powerPlayGoals"]
        playerTOI = parsed_player_data["stats"][0]["splits"][0]["stat"]["timeOnIce"]
        playerGWG = parsed_player_data["stats"][0]["splits"][0]["stat"]["gameWinningGoals"]
        playerPIM = parsed_player_data["stats"][0]["splits"][0]["stat"]["pim"]
        playerPoints = parsed_player_data["stats"][0]["splits"][0]["stat"]["points"]
        playerHits = parsed_player_data["stats"][0]["splits"][0]["stat"]["hits"]
    end

    Player.create(name: playerName, team: team1, playerID: playerID, goals: playerGoals, assists: playerAssts, 
    ppg: playerPPG, toi: playerTOI, gwg: playerGWG, pim: playerPIM, points: playerPoints, hits: playerHits)
    puts "Name: #{playerName} ID: #{playerID}  Goals: #{playerGoals}"
end