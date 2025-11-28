defmodule FutMasterChampionshipWeb.V1.States.StateJSON do
  alias FutMasterChampionship.Countries.State

  def index(%{states: states}) do
    %{data: for(state <- states, do: data(state))}
  end

  def show(%{state: state}) do
    %{data: data(state)}
  end

  defp data(%State{} = state) do
    %{
      id: state.id,
      name: state.name,
      acronym: state.acronym
    }
  end
end
