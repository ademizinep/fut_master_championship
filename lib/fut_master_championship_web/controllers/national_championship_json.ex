defmodule FutMasterChampionshipWeb.NationalChampionshipJSON do
  alias FutMasterChampionship.Sports.NationalChampionship

  @doc """
  Renders a list of national_championships.
  """
  def index(%{national_championships: national_championships}) do
    %{data: for(national_championship <- national_championships, do: data(national_championship))}
  end

  @doc """
  Renders a single national_championship.
  """
  def show(%{national_championship: national_championship}) do
    %{data: data(national_championship)}
  end

  defp data(%NationalChampionship{} = national_championship) do
    %{
      id: national_championship.id,
      name: national_championship.name,
      edition: national_championship.edition,
      year: national_championship.year,
      start_date: national_championship.start_date,
      end_date: national_championship.end_date,
      active: national_championship.active
    }
  end
end
