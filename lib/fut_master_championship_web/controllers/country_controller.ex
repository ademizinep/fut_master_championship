defmodule FutMasterChampionshipWeb.CountryController do
  use FutMasterChampionshipWeb, :controller

  alias FutMasterChampionship.Countries

  action_fallback FutMasterChampionshipWeb.FallbackController

  def index(conn, _params) do
    countries = Countries.list_countries()
    render(conn, :index, countries: countries)
  end

  def show(conn, %{"id" => id}) do
    country = Countries.get_country!(id)
    render(conn, :show, country: country)
  end
end
