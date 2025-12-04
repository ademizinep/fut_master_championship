defmodule FutMasterChampionshipWeb.V1.ChampionshipDivisions.ChampionshipDivisionController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"championship_id" => championship_id}) do
    championship_divisions = Sports.list_championship_divisions(championship_id)
    render(conn, :index, championship_divisions: championship_divisions)
  end

  def index(conn, _params) do
    championship_divisions = []
    render(conn, :index, championship_divisions: championship_divisions)
  end

  def show(conn, %{"id" => id}) do
    championship_division = Sports.get_championship_division!(id)
    render(conn, :show, championship_division: championship_division)
  end
end
