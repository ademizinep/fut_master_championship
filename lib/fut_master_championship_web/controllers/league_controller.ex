defmodule FutMasterChampionshipWeb.LeagueController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"type" => type, "country_id" => country_id}) do
    leagues = Sports.list_leagues(type, country_id)
    render(conn, :index, leagues: leagues)
  end

  def index(conn, _params) do
    leagues = []
    render(conn, :index, leagues: leagues)
  end

  def show(conn, %{"id" => id}) do
    league = Sports.get_league!(id)
    render(conn, :show, league: league)
  end
end
