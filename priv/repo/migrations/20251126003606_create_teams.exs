defmodule FutMasterChampionship.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :acronym, :string
      add :founded_date, :date
      add :shield_type, :string
      add :primary_color, :string
      add :secondary_color, :string
      add :tertiary_color, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end

    create unique_index(:teams, [:name])
  end
end
