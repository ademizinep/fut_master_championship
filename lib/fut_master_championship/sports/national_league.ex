defmodule FutMasterChampionship.Sports.NationalLeague do
  use Ecto.Schema
  import Ecto.Changeset

  schema "national_leagues" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(national_league, attrs) do
    national_league
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
