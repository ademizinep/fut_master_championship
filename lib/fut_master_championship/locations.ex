defmodule FutMasterChampionship.Locations do
  import Ecto.Query, warn: false
  alias FutMasterChampionship.Repo

  alias FutMasterChampionship.Locations.Country

  def create_country(attrs) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  def list_countries do
    Repo.all(Country)
  end

  def get_country!(id), do: Repo.get!(Country, id)

  alias FutMasterChampionship.Locations.State

  def create_state(attrs) do
    %State{}
    |> State.changeset(attrs)
    |> Repo.insert()
  end

  def list_states(country_id) do
    State
    |> where(country_id: ^country_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_state!(id), do: Repo.get!(State, id)
end
