defmodule FutMasterChampionshipWeb.V1.Countries.CountryController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Locations

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    countries = Locations.list_countries()
    render(conn, :index, countries: countries)
  end

  def show(conn, %{"id" => id}) do
    country = Locations.get_country!(id)
    render(conn, :show, country: country)
  end
end
