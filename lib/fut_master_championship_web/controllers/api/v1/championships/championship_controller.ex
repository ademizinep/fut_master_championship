defmodule FutMasterChampionshipWeb.V1.Championships.ChampionshipController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"type" => type, "league_id" => league_id}) do
    championships = Sports.list_championships(type, league_id)
    render(conn, :index, championships: championships)
  end

  def index(conn, _params) do
    championships = []
    render(conn, :index, championships: championships)
  end

  def show(conn, %{"id" => id}) do
    championship = Sports.get_championship!(id)
    render(conn, :show, championship: championship)
  end
end
