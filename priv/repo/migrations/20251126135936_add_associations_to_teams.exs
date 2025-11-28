defmodule FutMasterChampionship.Repo.Migrations.AddStateIdToTeams do
  use Ecto.Migration

  def change do
    alter table(:teams) do
      add :state_id, references(:states, on_delete: :restrict)
      add :country_id, references(:countries, on_delete: :restrict)
    end
  end
end
