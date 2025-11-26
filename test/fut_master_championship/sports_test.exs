defmodule FutMasterChampionship.SportsTest do
  use FutMasterChampionship.DataCase

  alias FutMasterChampionship.Sports

  describe "national_leagues" do
    alias FutMasterChampionship.Sports.NationalLeague

    import FutMasterChampionship.SportsFixtures

    @invalid_attrs %{name: nil}

    test "list_national_leagues/0 returns all national_leagues" do
      national_league = national_league_fixture()
      assert Sports.list_national_leagues() == [national_league]
    end

    test "get_national_league!/1 returns the national_league with given id" do
      national_league = national_league_fixture()
      assert Sports.get_national_league!(national_league.id) == national_league
    end

    test "create_national_league/1 with valid data creates a national_league" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %NationalLeague{} = national_league} = Sports.create_national_league(valid_attrs)
      assert national_league.name == "some name"
    end

    test "create_national_league/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sports.create_national_league(@invalid_attrs)
    end

    test "update_national_league/2 with valid data updates the national_league" do
      national_league = national_league_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %NationalLeague{} = national_league} = Sports.update_national_league(national_league, update_attrs)
      assert national_league.name == "some updated name"
    end

    test "update_national_league/2 with invalid data returns error changeset" do
      national_league = national_league_fixture()
      assert {:error, %Ecto.Changeset{}} = Sports.update_national_league(national_league, @invalid_attrs)
      assert national_league == Sports.get_national_league!(national_league.id)
    end

    test "delete_national_league/1 deletes the national_league" do
      national_league = national_league_fixture()
      assert {:ok, %NationalLeague{}} = Sports.delete_national_league(national_league)
      assert_raise Ecto.NoResultsError, fn -> Sports.get_national_league!(national_league.id) end
    end

    test "change_national_league/1 returns a national_league changeset" do
      national_league = national_league_fixture()
      assert %Ecto.Changeset{} = Sports.change_national_league(national_league)
    end
  end

  describe "state_leagues" do
    alias FutMasterChampionship.Sports.StateLeague

    import FutMasterChampionship.SportsFixtures

    @invalid_attrs %{name: nil}

    test "list_state_leagues/0 returns all state_leagues" do
      state_league = state_league_fixture()
      assert Sports.list_state_leagues() == [state_league]
    end

    test "get_state_league!/1 returns the state_league with given id" do
      state_league = state_league_fixture()
      assert Sports.get_state_league!(state_league.id) == state_league
    end

    test "create_state_league/1 with valid data creates a state_league" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %StateLeague{} = state_league} = Sports.create_state_league(valid_attrs)
      assert state_league.name == "some name"
    end

    test "create_state_league/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sports.create_state_league(@invalid_attrs)
    end

    test "update_state_league/2 with valid data updates the state_league" do
      state_league = state_league_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %StateLeague{} = state_league} = Sports.update_state_league(state_league, update_attrs)
      assert state_league.name == "some updated name"
    end

    test "update_state_league/2 with invalid data returns error changeset" do
      state_league = state_league_fixture()
      assert {:error, %Ecto.Changeset{}} = Sports.update_state_league(state_league, @invalid_attrs)
      assert state_league == Sports.get_state_league!(state_league.id)
    end

    test "delete_state_league/1 deletes the state_league" do
      state_league = state_league_fixture()
      assert {:ok, %StateLeague{}} = Sports.delete_state_league(state_league)
      assert_raise Ecto.NoResultsError, fn -> Sports.get_state_league!(state_league.id) end
    end

    test "change_state_league/1 returns a state_league changeset" do
      state_league = state_league_fixture()
      assert %Ecto.Changeset{} = Sports.change_state_league(state_league)
    end
  end
end
