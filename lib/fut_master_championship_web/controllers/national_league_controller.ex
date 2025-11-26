defmodule FutMasterChampionshipWeb.NationalLeagueController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    national_leagues = Sports.list_national_leagues()
    render(conn, :index, national_leagues: national_leagues)
  end

  def show(conn, %{"id" => id}) do
    national_league = Sports.get_national_league!(id)
    render(conn, :show, national_league: national_league)
  end
end
