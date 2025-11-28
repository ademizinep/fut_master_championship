defmodule FutMasterChampionship.Repo.Migrations.CreateNationalChampionships do
  use Ecto.Migration

  def change do
    create table(:national_championships) do
      add :name, :string
      add :type, :string
      add :edition, :string
      add :year, :integer
      add :start_date, :date
      add :end_date, :date
      add :active, :boolean, default: false, null: false

      add :league_id, references(:leagues, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end
  end
end
