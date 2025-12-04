defmodule FutMasterChampionship.Sports.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :name, :string
    field :age, :integer

    belongs_to :team, FutMasterChampionship.Sports.Team

    timestamps(type: :utc_datetime)
  end

  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
    |> foreign_key_constraint(:team_id)
    |> assoc_constraint(:team)
  end
end
