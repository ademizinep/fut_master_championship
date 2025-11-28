defmodule FutMasterChampionshipWeb.V1.Leagues.LeagueJSON do
  alias FutMasterChampionship.Sports.League

  def index(%{leagues: leagues}) do
    %{data: for(league <- leagues, do: data(league))}
  end

  def show(%{league: league}) do
    %{data: data(league)}
  end

  defp data(%League{} = league) do
    %{
      id: league.id,
      name: league.name,
      type: league.type
    }
  end
end
