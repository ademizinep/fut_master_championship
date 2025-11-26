defmodule FutMasterChampionshipWeb.StateLeagueControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.SportsFixtures
  alias FutMasterChampionship.Sports.StateLeague

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all state_leagues", %{conn: conn} do
      conn = get(conn, ~p"/api/state_leagues")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create state_league" do
    test "renders state_league when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/state_leagues", state_league: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/state_leagues/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/state_leagues", state_league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update state_league" do
    setup [:create_state_league]

    test "renders state_league when data is valid", %{conn: conn, state_league: %StateLeague{id: id} = state_league} do
      conn = put(conn, ~p"/api/state_leagues/#{state_league}", state_league: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/state_leagues/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, state_league: state_league} do
      conn = put(conn, ~p"/api/state_leagues/#{state_league}", state_league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete state_league" do
    setup [:create_state_league]

    test "deletes chosen state_league", %{conn: conn, state_league: state_league} do
      conn = delete(conn, ~p"/api/state_leagues/#{state_league}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/state_leagues/#{state_league}")
      end
    end
  end

  defp create_state_league(_) do
    state_league = state_league_fixture()

    %{state_league: state_league}
  end
end
