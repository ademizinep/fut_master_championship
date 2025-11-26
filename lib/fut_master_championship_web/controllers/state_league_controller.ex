defmodule FutMasterChampionshipWeb.StateLeagueController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    state_leagues = Sports.list_state_leagues()
    render(conn, :index, state_leagues: state_leagues)
  end

  def show(conn, %{"id" => id}) do
    state_league = Sports.get_state_league!(id)
    render(conn, :show, state_league: state_league)
  end
end
