defmodule FutMasterChampionship.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FutMasterChampionship.People` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> FutMasterChampionship.People.create_person()

    person
  end
end
