defmodule FutMasterChampionshipWeb.TeamController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    teams = Sports.list_teams()
    render(conn, :index, teams: teams)
  end

  def show(conn, %{"id" => id}) do
    team = Sports.get_team!(id)
    render(conn, :show, team: team)
  end
end
