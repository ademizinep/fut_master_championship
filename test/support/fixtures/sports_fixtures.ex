defmodule FutMasterChampionship.SportsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FutMasterChampionship.Sports` context.
  """

  @doc """
  Generate a national_league.
  """
  def national_league_fixture(attrs \\ %{}) do
    {:ok, national_league} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FutMasterChampionship.Sports.create_national_league()

    national_league
  end

  @doc """
  Generate a state_league.
  """
  def state_league_fixture(attrs \\ %{}) do
    {:ok, state_league} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FutMasterChampionship.Sports.create_state_league()

    state_league
  end

  @doc """
  Generate a national_championship.
  """
  def national_championship_fixture(attrs \\ %{}) do
    {:ok, national_championship} =
      attrs
      |> Enum.into(%{
        active: true,
        edition: "some edition",
        end_date: ~D[2025-11-25],
        name: "some name",
        start_date: ~D[2025-11-25],
        year: 42
      })
      |> FutMasterChampionship.Sports.create_national_championship()

    national_championship
  end

  @doc """
  Generate a state_championship.
  """
  def state_championship_fixture(attrs \\ %{}) do
    {:ok, state_championship} =
      attrs
      |> Enum.into(%{
        active: true,
        edition: "some edition",
        end_date: ~D[2025-11-25],
        name: "some name",
        start_date: ~D[2025-11-25],
        year: 42
      })
      |> FutMasterChampionship.Sports.create_state_championship()

    state_championship
  end
end
