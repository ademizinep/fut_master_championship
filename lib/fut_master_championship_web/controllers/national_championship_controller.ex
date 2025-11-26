defmodule FutMasterChampionshipWeb.NationalChampionshipController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Sports

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    national_championships = Sports.list_national_championships()
    render(conn, :index, national_championships: national_championships)
  end

  def show(conn, %{"id" => id}) do
    national_championship = Sports.get_national_championship!(id)
    render(conn, :show, national_championship: national_championship)
  end
end
