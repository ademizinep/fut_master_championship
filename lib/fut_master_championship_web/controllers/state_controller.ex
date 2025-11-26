defmodule FutMasterChampionshipWeb.StateController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.States

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    states = States.list_states()
    render(conn, :index, states: states)
  end

  def show(conn, %{"id" => id}) do
    state = States.get_state!(id)
    render(conn, :show, state: state)
  end
end
