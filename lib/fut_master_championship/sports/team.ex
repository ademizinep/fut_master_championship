defmodule FutMasterChampionship.Sports.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :acronym, :string

    has_many :people, FutMasterChampionship.People.Person

    belongs_to :state, FutMasterChampionship.Locations.State
    belongs_to :country, FutMasterChampionship.Locations.Country

    timestamps(type: :utc_datetime)
  end

  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :acronym, :state_id, :country_id])
    |> validate_required([:name, :acronym, :state_id, :country_id])
    |> validate_length(:acronym, min: 3, max: 3)
    |> foreign_key_constraint(:state_id)
    |> foreign_key_constraint(:country_id)
    |> assoc_constraint(:country)
    |> assoc_constraint(:state)
    |> unique_constraint(:name)
  end
end
