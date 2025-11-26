defmodule FutMasterChampionship.Repo.Migrations.CreateStateChampionships do
  use Ecto.Migration

  def change do
    create table(:state_championships) do
      add :name, :string
      add :edition, :string
      add :year, :integer
      add :start_date, :date
      add :end_date, :date
      add :active, :boolean, default: false, null: false
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:state_championships, [:country_id])
  end
end
