defmodule FutMasterChampionship.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string
    field :email, :string

    belongs_to :team, FutMasterChampionship.Sports.Team

    timestamps(type: :utc_datetime)
  end

  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3)
    |> validate_length(:email, min: 3)
    |> validate_length(:email, max: 255)
    |> unique_constraint([:email, :team_id])
    |> foreign_key_constraint(:team_id)
    |> assoc_constraint(:team)
  end
end
