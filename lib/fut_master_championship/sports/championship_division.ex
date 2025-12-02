defmodule FutMasterChampionship.Sports.ChampionshipDivision do
  use Ecto.Schema
  import Ecto.Changeset

  schema "championship_divisions" do
    field :name, :string

    belongs_to :championship, FutMasterChampionship.Sports.Championship

    timestamps(type: :utc_datetime)
  end

  def changeset(championship_division, attrs) do
    championship_division
    |> cast(attrs, [:name, :championship_id])
    |> validate_required([:name, :championship_id])
    |> foreign_key_constraint(:championship_id)
    |> assoc_constraint(:championship)
  end
end
