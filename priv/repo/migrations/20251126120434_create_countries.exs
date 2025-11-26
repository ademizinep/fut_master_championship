defmodule FutMasterChampionship.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :acronym, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:countries, [:name])
    create unique_index(:countries, [:acronym])
  end
end
