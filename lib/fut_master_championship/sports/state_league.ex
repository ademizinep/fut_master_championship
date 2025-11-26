defmodule FutMasterChampionship.Sports.StateLeague do
  use Ecto.Schema
  import Ecto.Changeset

  schema "state_leagues" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(state_league, attrs) do
    state_league
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
