defmodule FutMasterChampionship.Sports do
  import Ecto.Query, warn: false
  alias FutMasterChampionship.Repo

  # Leagues
  alias FutMasterChampionship.Sports.League

  def list_leagues(type \\ nil, country_id \\ nil) do
    League
    |> where(type: ^type, country_id: ^country_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_league!(id), do: Repo.get!(League, id)

  alias FutMasterChampionship.Sports.Team

  def list_teams(country_id, state_id \\ nil) do
    Team
    |> list_teams_query(country_id, state_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  defp list_teams_query(query, country_id, nil) do
    where(query, country_id: ^country_id)
  end

  defp list_teams_query(query, country_id, state_id) do
    where(query, country_id: ^country_id, state_id: ^state_id)
  end

  def get_team!(id), do: Repo.get!(Team, id)

  #National Championships
  alias FutMasterChampionship.Sports.Championship

  def list_championships(type, league_id) do
    Championship
    |> where(type: ^type, league_id: ^league_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_championship!(id), do: Repo.get!(Championship, id)

  def create_championship(attrs) do
    %Championship{}
    |> Championship.changeset(attrs)
    |> Repo.insert()
  end

  def update_championship(%Championship{} = championship, attrs) do
    championship
    |> Championship.changeset(attrs)
    |> Repo.update()
  end

  def delete_championship(%Championship{} = championship) do
    Repo.delete(championship)
  end

  def change_championship(%Championship{} = championship, attrs \\ %{}) do
    Championship.changeset(championship, attrs)
  end

  # Players
  alias FutMasterChampionship.Sports.Player

  def list_players(team_id) do
    Player
    |> where(team_id: ^team_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def list_players() do
    Player
    |> order_by(asc: :name)
    |> Repo.all()
  end


  def get_player!(id), do: Repo.get!(Player, id)

  def create_player(attrs) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  # Championship Divisions
  alias FutMasterChampionship.Sports.ChampionshipDivision

  def list_championship_divisions(championship_id) do
    ChampionshipDivision
    |> where(championship_id: ^championship_id)
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_championship_division!(id), do: Repo.get!(ChampionshipDivision, id)
end
