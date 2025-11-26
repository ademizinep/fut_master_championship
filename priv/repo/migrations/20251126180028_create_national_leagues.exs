defmodule FutMasterChampionship.Repo.Migrations.CreateNationalLeagues do
  use Ecto.Migration

  def change do
    create table(:national_leagues) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
