defmodule FutMasterChampionshipWeb.V1.Championships.ChampionshipJSON do
  alias FutMasterChampionship.Sports.Championship

  def index(%{championships: championships}) do
    %{data: for(championship <- championships, do: data(championship))}
  end

  def show(%{championship: championship}) do
    %{data: data(championship)}
  end

  defp data(%Championship{} = championship) do
    %{
      id: championship.id,
      name: championship.name,
      edition: championship.edition,
      year: championship.year,
      start_date: championship.start_date,
      end_date: championship.end_date,
      active: championship.active
    }
  end
end
