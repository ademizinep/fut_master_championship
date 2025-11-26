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
end
