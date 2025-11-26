defmodule FutMasterChampionship.StatesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FutMasterChampionship.States` context.
  """

  @doc """
  Generate a state.
  """
  def state_fixture(attrs \\ %{}) do
    {:ok, state} =
      attrs
      |> Enum.into(%{
        acronym: "some acronym",
        name: "some name"
      })
      |> FutMasterChampionship.States.create_state()

    state
  end
end
