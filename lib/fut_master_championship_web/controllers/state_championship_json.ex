defmodule FutMasterChampionshipWeb.StateChampionshipJSON do
  alias FutMasterChampionship.Sports.StateChampionship

  @doc """
  Renders a list of state_championships.
  """
  def index(%{state_championships: state_championships}) do
    %{data: for(state_championship <- state_championships, do: data(state_championship))}
  end

  @doc """
  Renders a single state_championship.
  """
  def show(%{state_championship: state_championship}) do
    %{data: data(state_championship)}
  end

  defp data(%StateChampionship{} = state_championship) do
    %{
      id: state_championship.id,
      name: state_championship.name,
      edition: state_championship.edition,
      year: state_championship.year,
      start_date: state_championship.start_date,
      end_date: state_championship.end_date,
      active: state_championship.active
    }
  end
end
