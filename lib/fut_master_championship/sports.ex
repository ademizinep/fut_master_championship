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
end
