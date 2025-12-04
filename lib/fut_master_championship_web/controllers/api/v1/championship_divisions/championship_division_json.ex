defmodule FutMasterChampionshipWeb.V1.ChampionshipDivisions.ChampionshipDivisionJSON do
  alias FutMasterChampionship.Sports.ChampionshipDivision

  def index(%{championship_divisions: championship_divisions}) do
    %{data: for(championship_division <- championship_divisions, do: data(championship_division))}
  end

  def show(%{championship_division: championship_division}) do
    %{data: data(championship_division)}
  end

  defp data(%ChampionshipDivision{} = championship_division) do
    %{
      id: championship_division.id,
      name: championship_division.name,
      championship_id: championship_division.championship_id
    }
  end
end
