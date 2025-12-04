defmodule FutMasterChampionshipWeb.V1.Countries.CountryJSON do
  alias FutMasterChampionship.Locations.Country

  def index(%{countries: countries}) do
    %{data: for(country <- countries, do: data(country))}
  end

  def show(%{country: country}) do
    %{data: data(country)}
  end

  defp data(%Country{} = country) do
    %{
      id: country.id,
      name: country.name,
      acronym: country.acronym
    }
  end
end
