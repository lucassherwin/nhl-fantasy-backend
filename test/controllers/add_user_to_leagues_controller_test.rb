require 'test_helper'

class AddUserToLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_user_to_league = add_user_to_leagues(:one)
  end

  test "should get index" do
    get add_user_to_leagues_url, as: :json
    assert_response :success
  end

  test "should create add_user_to_league" do
    assert_difference('AddUserToLeague.count') do
      post add_user_to_leagues_url, params: { add_user_to_league: { leagueID: @add_user_to_league.leagueID, userID: @add_user_to_league.userID } }, as: :json
    end

    assert_response 201
  end

  test "should show add_user_to_league" do
    get add_user_to_league_url(@add_user_to_league), as: :json
    assert_response :success
  end

  test "should update add_user_to_league" do
    patch add_user_to_league_url(@add_user_to_league), params: { add_user_to_league: { leagueID: @add_user_to_league.leagueID, userID: @add_user_to_league.userID } }, as: :json
    assert_response 200
  end

  test "should destroy add_user_to_league" do
    assert_difference('AddUserToLeague.count', -1) do
      delete add_user_to_league_url(@add_user_to_league), as: :json
    end

    assert_response 204
  end
end
