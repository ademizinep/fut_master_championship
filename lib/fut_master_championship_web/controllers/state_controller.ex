defmodule FutMasterChampionshipWeb.StateController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Countries

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, %{"country_id" => country_id}) do
    states = Countries.list_states(country_id)
    render(conn, :index, states: states)
  end

  def index(conn, _params) do
    states = []
    render(conn, :index, states: states)
  end

  def show(conn, %{"id" => id}) do
    state = Countries.get_state!(id)
    render(conn, :show, state: state)
  end
end
