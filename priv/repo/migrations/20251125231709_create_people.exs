defmodule FutMasterChampionship.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:people, [:email])
  end
end
