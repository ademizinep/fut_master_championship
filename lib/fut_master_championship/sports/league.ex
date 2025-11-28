defmodule FutMasterChampionship.Sports.League do
  use Ecto.Schema
  import Ecto.Changeset

  @types ["national", "state"]

  schema "leagues" do
    field :name, :string
    field :type, :string

    belongs_to :country, FutMasterChampionship.Countries.Country
    belongs_to :state, FutMasterChampionship.Countries.State

    has_many :championships, FutMasterChampionship.Sports.Championship

    timestamps(type: :utc_datetime)
  end

  def changeset(league, attrs) do
    league
    |> cast(attrs, [:name, :type, :country_id, :state_id])
    |> validate_required([:name, :type, :country_id])
    |> validate_inclusion(:type, @types)
    |> validate_length(:name, min: 3, max: 100)
    |> validate_league_scope()
    |> foreign_key_constraint(:country_id)
    |> foreign_key_constraint(:state_id)
    |> assoc_constraint(:country)
    |> assoc_constraint(:state)
    |> unique_constraint([:name, :country_id], name: :leagues_unique_national)
    |> unique_constraint([:name, :state_id], name: :leagues_unique_state)
  end

  defp validate_league_scope(changeset) do
    type = get_field(changeset, :type)
    state_id = get_field(changeset, :state_id)

    case type do
      "national" ->
        if state_id do
          add_error(changeset, :state_id, "must be null for national leagues")
        else
          changeset
        end

      "state" ->
        if is_nil(state_id) do
          add_error(changeset, :state_id, "can't be blank for state leagues")
        else
          changeset
        end

      _ ->
        changeset
    end
  end
end
