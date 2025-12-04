defmodule FutMasterChampionship.Sports.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @shield_types [
    "round",
    "square",
    "square_diagonal",
    "circle_diagonal",
    "square_with_circle",
    "circle_with_rhombus",
    "circle_with_square",
    "square_with_circle_and_rhombus",
    "circle_with_square_and_rhombus"
  ]

  schema "teams" do
    field :name, :string
    field :acronym, :string
    field :founded_date, :date
    field :shield_type, :string
    field :primary_color, :string
    field :secondary_color, :string
    field :tertiary_color, :string
    field :description, :string

    has_many :people, FutMasterChampionship.People.Person

    belongs_to :state, FutMasterChampionship.Locations.State
    belongs_to :country, FutMasterChampionship.Locations.Country

    has_many :championship_divise_teams, FutMasterChampionship.Sports.ChampionshipDiviseTeam
    has_many :divisions_through_join, through: [:championship_divise_teams, :championship_division]

    timestamps(type: :utc_datetime)
  end

  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :acronym, :founded_date, :shield_type, :primary_color, :secondary_color, :tertiary_color, :description, :state_id, :country_id])
    |> validate_required([:name, :acronym, :state_id, :country_id, :founded_date, :shield_type, :primary_color, :secondary_color, :tertiary_color, :description])
    |> validate_length(:acronym, min: 3, max: 3)
    |> validate_inclusion(:shield_type, @shield_types)
    |> validate_length(:description, max: 255)
    |> foreign_key_constraint(:state_id)
    |> foreign_key_constraint(:country_id)
    |> assoc_constraint(:country)
    |> assoc_constraint(:state)
    |> unique_constraint(:name)
  end
end
