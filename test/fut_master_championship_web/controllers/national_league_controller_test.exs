defmodule FutMasterChampionshipWeb.NationalLeagueControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.SportsFixtures
  alias FutMasterChampionship.Sports.NationalLeague

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
    test "lists all national_leagues", %{conn: conn} do
      conn = get(conn, ~p"/api/national_leagues")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create national_league" do
    test "renders national_league when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/national_leagues", national_league: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/national_leagues/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/national_leagues", national_league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update national_league" do
    setup [:create_national_league]

    test "renders national_league when data is valid", %{conn: conn, national_league: %NationalLeague{id: id} = national_league} do
      conn = put(conn, ~p"/api/national_leagues/#{national_league}", national_league: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/national_leagues/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, national_league: national_league} do
      conn = put(conn, ~p"/api/national_leagues/#{national_league}", national_league: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete national_league" do
    setup [:create_national_league]

    test "deletes chosen national_league", %{conn: conn, national_league: national_league} do
      conn = delete(conn, ~p"/api/national_leagues/#{national_league}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/national_leagues/#{national_league}")
      end
    end
  end

  defp create_national_league(_) do
    national_league = national_league_fixture()

    %{national_league: national_league}
  end
end
