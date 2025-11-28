defmodule FutMasterChampionship.Repo.Migrations.AddAssociationsToTeam do
  use Ecto.Migration

  def change do
    alter table(:teams) do
      add :country_id, references(:countries, on_delete: :restrict)
      add :league_id, references(:leagues, on_delete: :restrict)
    end
  end
end
