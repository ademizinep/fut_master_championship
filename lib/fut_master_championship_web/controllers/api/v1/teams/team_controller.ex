defmodule FutMasterChampionshipWeb.V1.Teams.TeamController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"country_id" => country_id, "state_id" => state_id}) do
    teams = Sports.list_teams(country_id, state_id)
    render(conn, :index, teams: teams)
  end

  def index(conn, %{"country_id" => country_id}) do
    teams = Sports.list_teams(country_id)
    render(conn, :index, teams: teams)
  end

  def index(conn, _params) do
    teams = []
    render(conn, :index, teams: teams)
  end

  def show(conn, %{"id" => id}) do
    team = Sports.get_team!(id)
    render(conn, :show, team: team)
  end
end
