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
    |> cast(attrs, [:name, :type, :edition, :year, :start_date, :end_date, :active, :country_id, :state_id, :league_id])
    |> validate_required([:name, :type, :edition, :year, :start_date, :end_date, :active, :country_id, :league_id])
    |> validate_inclusion(:type, @types)
    |> validate_league_scope()
    |> foreign_key_constraint(:country_id)
    |> foreign_key_constraint(:state_id)
    |> foreign_key_constraint(:league_id)
    |> assoc_constraint(:country)
    |> assoc_constraint(:state)
    |> assoc_constraint(:league)
  end

  defp validate_league_scope(changeset) do
    type = get_field(changeset, :type)
    state_id = get_field(changeset, :state_id)

    case type do
      "national" ->
        if state_id do
          add_error(changeset, :state_id, "must be null for national championships")
        else
          changeset
        end

      "state" ->
        if is_nil(state_id) do
          add_error(changeset, :state_id, "can't be blank for state championships")
        else
          changeset
        end

      _ ->
        changeset
    end
  end
end
