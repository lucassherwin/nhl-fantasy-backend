require 'rest-client'
require 'json'
require 'byebug'

User.destroy_all
Team.destroy_all
Player.destroy_all

unparsed_team_data = RestClient.get('https://statsapi.web.nhl.com/api/v1/teams')
parsed_team_data = JSON.parse(unparsed_team_data)

teamArr = []
#gets all the teams id's and saves them in the teamArr array
parsed_team_data["teams"].each do |team|
    teamArr << team["id"]
end

teamArr.each do |id|
    unparsed_data = RestClient.get("https://statsapi.web.nhl.com/api/v1/teams/#{id}/roster")
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
    
        unparsed_player_stats_data = RestClient.get("https://statsapi.web.nhl.com/api/v1/people/#{playerID}/stats?stats=statsSingleSeason&season=20192020")
        parsed_player_stats_data = JSON.parse(unparsed_player_stats_data)
        
        playerGoals = 0
        if(parsed_player_stats_data["stats"][0]["splits"][0] == nil)
            #kevan miller exception
            #out for season no goals
            playerGoals = 0
        elsif(parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["goals"] == nil)
            #goalie exception
            playerGoals = nil
            #fill in goalie information
        else
            playerGoals = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["goals"]
            playerAssts = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["assists"]
            playerPPG = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["powerPlayGoals"]
            playerTOI = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["timeOnIce"]
            playerGWG = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["gameWinningGoals"]
            playerPIM = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["pim"]
            playerPoints = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["points"]
            playerHits = parsed_player_stats_data["stats"][0]["splits"][0]["stat"]["hits"]
        end

        unparsed_player_data = RestClient.get("https://statsapi.web.nhl.com/api/v1/people/#{playerID}")
        parsed_player_data = JSON.parse(unparsed_player_data)

        playerNumber = parsed_player_data["people"][0]["primaryNumber"]
        playerPos = parsed_player_data["people"][0]["primaryPosition"]["code"]
        playerCurrentTeam = parsed_player_data["people"][0]["currentTeam"]["name"]

        Player.create(name: playerName, goals: playerGoals, assists: playerAssts, ppg: playerPPG, toi: playerTOI, 
            gwg: playerGWG, pim: playerPIM, points: playerPoints, hits: playerHits, position: playerPos, current_team: playerCurrentTeam, number: playerNumber)
        puts "Name: #{playerName} ID: #{playerID} Goals: #{playerGoals} ##{playerNumber} #{playerCurrentTeam} #{playerPos}"
    end    
end

# playerID: playerID,
# team: team1,