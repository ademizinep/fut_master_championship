defmodule FutMasterChampionship.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :acronym, :string

    has_many :people, FutMasterChampionship.People.Person
    belongs_to :state, FutMasterChampionship.States.State

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :acronym, :state_id])
    |> validate_required([:name, :acronym, :state_id])
    |> foreign_key_constraint(:state_id)
    |> assoc_constraint(:state)
    |> unique_constraint(:name)
  end
end
