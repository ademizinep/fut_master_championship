# lib/fut_master_championship/sports/championship_team.ex
defmodule FutMasterChampionship.Sports.ChampionshipDiviseTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "championship_divise_teams" do
    field :points, :integer, default: 0
    field :wins, :integer, default: 0
    field :draws, :integer, default: 0
    field :losses, :integer, default: 0
    field :goals_for, :integer, default: 0
    field :goals_against, :integer, default: 0
    field :position, :integer
    field :joined_at, :date

    belongs_to :team, FutMasterChampionship.Sports.Team
    belongs_to :championship_division, FutMasterChampionship.Sports.ChampionshipDivision

    timestamps(type: :utc_datetime)
  end

  def changeset(championship_divise_team, attrs) do
    championship_divise_team
    |> cast(attrs, [
      :team_id,
      :championship_division_id,
      :points,
      :wins,
      :draws,
      :losses,
      :goals_for,
      :goals_against,
      :position,
      :joined_at
    ])
    |> validate_required([:team_id, :championship_division_id])
    |> validate_number(:points, greater_than_or_equal_to: 0)
    |> validate_number(:wins, greater_than_or_equal_to: 0)
    |> validate_number(:draws, greater_than_or_equal_to: 0)
    |> validate_number(:losses, greater_than_or_equal_to: 0)
    |> validate_number(:goals_for, greater_than_or_equal_to: 0)
    |> validate_number(:goals_against, greater_than_or_equal_to: 0)
    |> foreign_key_constraint(:team_id)
    |> foreign_key_constraint(:championship_division_id)
    |> unique_constraint([:team_id, :championship_division_id])
  end
end
