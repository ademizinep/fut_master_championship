defmodule FutMasterChampionship.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string
      add :acronym, :string
      add :region, :string

      add :country_id, references(:countries, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:states, [:name, :country_id, :region])
    create unique_index(:states, [:acronym, :country_id, :region])
  end
end
