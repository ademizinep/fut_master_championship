defmodule FutMasterChampionship.Repo.Migrations.CreateChampionshipDivisions do
  use Ecto.Migration

  def change do
    create table(:championship_divisions) do
      add :name, :string

      add :championship_id, references(:championships, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end
  end
end
