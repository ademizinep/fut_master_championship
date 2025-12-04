defmodule FutMasterChampionship.Sports.ChampionshipDivision do
  use Ecto.Schema
  import Ecto.Changeset

  @types ["A", "B", "C"]

  schema "championship_divisions" do
    field :name, :string
    field :type, :string

    belongs_to :championship, FutMasterChampionship.Sports.Championship

    has_many :championship_divise_teams, FutMasterChampionship.Sports.ChampionshipDiviseTeam
    has_many :teams_through_join, through: [:championship_divise_teams, :team]

    timestamps(type: :utc_datetime)
  end

  def changeset(championship_division, attrs) do
    championship_division
    |> cast(attrs, [:name, :type, :championship_id])
    |> validate_required([:name, :type, :championship_id])
    |> validate_inclusion(:type, @types)
    |> foreign_key_constraint(:championship_id)
    |> assoc_constraint(:championship)
  end
end
