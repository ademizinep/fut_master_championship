defmodule FutMasterChampionship.Sports.Championship do
  use Ecto.Schema
  import Ecto.Changeset

  @types ["national", "state", "regional"]

  schema "championships" do
    field :name, :string
    field :type, :string
    field :edition, :string
    field :year, :integer
    field :start_date, :date
    field :end_date, :date
    field :active, :boolean, default: false

    belongs_to :league, FutMasterChampionship.Sports.League

    timestamps(type: :utc_datetime)
  end

  def changeset(championship, attrs) do
    championship
    |> cast(attrs, [:name, :type, :edition, :year, :start_date, :end_date, :active, :league_id])
    |> validate_required([:name, :type, :edition, :year, :start_date, :end_date, :active, :league_id])
    |> validate_inclusion(:type, @types)
    |> foreign_key_constraint(:league_id)
    |> assoc_constraint(:league)
  end
end
