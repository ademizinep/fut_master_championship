defmodule FutMasterChampionshipWeb.StateLeagueJSON do
  alias FutMasterChampionship.Sports.StateLeague

  @doc """
  Renders a list of state_leagues.
  """
  def index(%{state_leagues: state_leagues}) do
    %{data: for(state_league <- state_leagues, do: data(state_league))}
  end

  @doc """
  Renders a single state_league.
  """
  def show(%{state_league: state_league}) do
    %{data: data(state_league)}
  end

  defp data(%StateLeague{} = state_league) do
    %{
      id: state_league.id,
      name: state_league.name
    }
  end
end
