defmodule FutMasterChampionship.Sports do
  import Ecto.Query, warn: false
  alias FutMasterChampionship.Repo

  alias FutMasterChampionship.Sports.NationalLeague

  def list_national_leagues do
    NationalLeague
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_national_league!(id), do: Repo.get!(NationalLeague, id)

  alias FutMasterChampionship.Sports.StateLeague

  def list_state_leagues do
    StateLeague
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_state_league!(id), do: Repo.get!(StateLeague, id)

  alias FutMasterChampionship.Sports.Team

  def list_teams do
    Team
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_team!(id), do: Repo.get!(Team, id)

  #National Championships
  alias FutMasterChampionship.Sports.NationalChampionship

  def list_national_championships do
    NationalChampionship
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_national_championship!(id), do: Repo.get!(NationalChampionship, id)

  def create_national_championship(attrs) do
    %NationalChampionship{}
    |> NationalChampionship.changeset(attrs)
    |> Repo.insert()
  end

  def update_national_championship(%NationalChampionship{} = national_championship, attrs) do
    national_championship
    |> NationalChampionship.changeset(attrs)
    |> Repo.update()
  end

  def delete_national_championship(%NationalChampionship{} = national_championship) do
    Repo.delete(national_championship)
  end

  def change_national_championship(%NationalChampionship{} = national_championship, attrs \\ %{}) do
    NationalChampionship.changeset(national_championship, attrs)
  end

  #State Championships
  alias FutMasterChampionship.Sports.StateChampionship

  def list_state_championships do
    StateChampionship
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_state_championship!(id), do: Repo.get!(StateChampionship, id)

  def create_state_championship(attrs) do
    %StateChampionship{}
    |> StateChampionship.changeset(attrs)
    |> Repo.insert()
  end

  def update_state_championship(%StateChampionship{} = state_championship, attrs) do
    state_championship
    |> StateChampionship.changeset(attrs)
    |> Repo.update()
  end

  def delete_state_championship(%StateChampionship{} = state_championship) do
    Repo.delete(state_championship)
  end

  def change_state_championship(%StateChampionship{} = state_championship, attrs \\ %{}) do
    StateChampionship.changeset(state_championship, attrs)
  end
end
