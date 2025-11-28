defmodule FutMasterChampionship.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues) do
      add :name, :string
      add :type, :string

      add :country_id, references(:countries, on_delete: :restrict)
      add :state_id, references(:states, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:leagues, [:name, :country_id], where: "type = 'national' AND state_id IS NULL", name: :league_national_unique_index)
    create unique_index(:leagues, [:name, :state_id], where: "type = 'state' AND state_id IS NOT NULL", name: :league_state_unique_index)
  end
end
