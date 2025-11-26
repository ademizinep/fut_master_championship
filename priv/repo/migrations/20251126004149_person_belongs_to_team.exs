defmodule FutMasterChampionship.Repo.Migrations.PersonBelongsToTeam do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :team_id, references(:teams)
    end

    create index(:people, [:team_id])
  end
end
