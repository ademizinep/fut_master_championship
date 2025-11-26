defmodule FutMasterChampionship.Countries.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    field :acronym, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :acronym])
    |> validate_required([:name, :acronym])
    |> unique_constraint([:name, :acronym])
  end
end
