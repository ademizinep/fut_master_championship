defmodule FutMasterChampionship.Repo.Migrations.CreateChampionshipDiviseTeams do
  use Ecto.Migration

  def change do
    create table(:championship_divise_teams) do
      add :team_id, references(:teams, on_delete: :delete_all), null: false
      add :championship_division_id, references(:championship_divisions, on_delete: :delete_all), null: false

      add :points, :integer, default: 0
      add :wins, :integer, default: 0
      add :draws, :integer, default: 0
      add :losses, :integer, default: 0
      add :goals_for, :integer, default: 0
      add :goals_against, :integer, default: 0
      add :position, :integer
      add :joined_at, :date

      timestamps(type: :utc_datetime)
    end

    create unique_index(:championship_divise_teams, [:team_id, :championship_division_id])
  end
end
