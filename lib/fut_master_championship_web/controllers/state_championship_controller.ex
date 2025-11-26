defmodule FutMasterChampionshipWeb.StateChampionshipController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    state_championships = Sports.list_state_championships()
    render(conn, :index, state_championships: state_championships)
  end

  def show(conn, %{"id" => id}) do
    state_championship = Sports.get_state_championship!(id)
    render(conn, :show, state_championship: state_championship)
  end
end
