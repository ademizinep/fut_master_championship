defmodule FutMasterChampionshipWeb.NationalLeagueJSON do
  alias FutMasterChampionship.Sports.NationalLeague

  @doc """
  Renders a list of national_leagues.
  """
  def index(%{national_leagues: national_leagues}) do
    %{data: for(national_league <- national_leagues, do: data(national_league))}
  end

  @doc """
  Renders a single national_league.
  """
  def show(%{national_league: national_league}) do
    %{data: data(national_league)}
  end

  defp data(%NationalLeague{} = national_league) do
    %{
      id: national_league.id,
      name: national_league.name
    }
  end
end
