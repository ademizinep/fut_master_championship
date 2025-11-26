defmodule FutMasterChampionship.CountriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FutMasterChampionship.Countries` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        acronym: "some acronym",
        name: "some name"
      })
      |> FutMasterChampionship.Countries.create_country()

    country
  end
end
