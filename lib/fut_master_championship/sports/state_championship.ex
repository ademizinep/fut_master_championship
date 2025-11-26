defmodule FutMasterChampionship.Sports.StateChampionship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "state_championships" do
    field :name, :string
    field :edition, :string
    field :year, :integer
    field :start_date, :date
    field :end_date, :date
    field :active, :boolean, default: false
    field :country_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(state_championship, attrs) do
    state_championship
    |> cast(attrs, [:name, :edition, :year, :start_date, :end_date, :active])
    |> validate_required([:name, :edition, :year, :start_date, :end_date, :active])
  end
end
