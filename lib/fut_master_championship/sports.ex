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

  alias FutMasterChampionship.Sports.ChampionshipDiviseTeam

  def add_team_to_division(team_id, division_id, attrs \\ %{}) do
    attrs = Map.merge(attrs, %{
      team_id: team_id,
      championship_division_id: division_id,
      joined_at: attrs[:joined_at] || Date.utc_today()
    })

    %ChampionshipDiviseTeam{}
    |> ChampionshipDiviseTeam.changeset(attrs)
    |> Repo.insert()
  end

  def remove_team_from_division(team_id, division_id) do
    ChampionshipTeam
    |> where([ct], ct.team_id == ^team_id and ct.championship_division_id == ^division_id)
    |> Repo.one()
    |> case do
      nil -> {:error, :not_found}
      championship_team -> Repo.delete(championship_team)
    end
  end

  def list_division_teams(division_id) do
    ChampionshipDiviseTeam
    |> where([ct], ct.championship_division_id == ^division_id)
    |> order_by([ct], desc: :points, desc: :wins, desc: fragment("goals_for - goals_against"))
    |> preload(:team)
    |> Repo.all()
  end

  def list_division_teams_simple(division_id) do
    ChampionshipDiviseTeam
    |> Repo.get!(division_id)
    |> Repo.preload(:teams)
    |> Map.get(:teams)
  end

  def list_team_divisions(team_id) do
    Team
    |> Repo.get!(team_id)
    |> Repo.preload(:championship_divisions)
    |> Map.get(:championship_divisions)
  end
end
