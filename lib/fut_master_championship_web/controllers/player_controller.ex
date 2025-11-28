defmodule FutMasterChampionshipWeb.PlayerController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"team_id" => team_id}) do
    players = Sports.list_players(team_id)
    render(conn, :index, players: players)
  end

  def index(conn, _params) do
    players = Sports.list_players()
    render(conn, :index, players: players)
  end

  def show(conn, %{"id" => id}) do
    player = Sports.get_player!(id)
    render(conn, :show, player: player)
  end
end
