defmodule FutMasterChampionship.Countries do
  import Ecto.Query, warn: false
  alias FutMasterChampionship.Repo

  alias FutMasterChampionship.Countries.Country

  def list_countries do
    Repo.all(Country)
  end

  def get_country!(id), do: Repo.get!(Country, id)

  alias FutMasterChampionship.Countries.State

  def list_states(country_id) do
    State
    |> where(country_id: ^country_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_state!(id), do: Repo.get!(State, id)
end
