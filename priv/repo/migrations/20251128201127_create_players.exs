defmodule FutMasterChampionship.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :age, :integer

      add :team_id, references(:teams, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:players, [:team_id])
  end
end
