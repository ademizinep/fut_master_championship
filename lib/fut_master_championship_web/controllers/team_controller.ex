defmodule FutMasterChampionshipWeb.TeamController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Teams

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    teams = Teams.list_teams()
    render(conn, :index, teams: teams)
  end

  def show(conn, %{"id" => id}) do
    team = Teams.get_team!(id)
    render(conn, :show, team: team)
  end
end
