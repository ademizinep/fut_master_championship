defmodule FutMasterChampionship.Countries.State do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :name, :string
    field :acronym, :string
    field :region, :string

    belongs_to :country, FutMasterChampionship.Countries.Country

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(state, attrs) do
    state
    |> cast(attrs, [:name, :acronym, :region, :country_id])
    |> validate_required([:name, :acronym, :region, :country_id])
    |> validate_inclusion(:country_id, FutMasterChampionship.Countries.list_countries())
  end
end
