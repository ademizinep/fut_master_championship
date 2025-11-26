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

  describe "national_championships" do
    alias FutMasterChampionship.Sports.NationalChampionship

    import FutMasterChampionship.SportsFixtures

    @invalid_attrs %{active: nil, name: nil, year: nil, edition: nil, start_date: nil, end_date: nil}

    test "list_national_championships/0 returns all national_championships" do
      national_championship = national_championship_fixture()
      assert Sports.list_national_championships() == [national_championship]
    end

    test "get_national_championship!/1 returns the national_championship with given id" do
      national_championship = national_championship_fixture()
      assert Sports.get_national_championship!(national_championship.id) == national_championship
    end

    test "create_national_championship/1 with valid data creates a national_championship" do
      valid_attrs = %{active: true, name: "some name", year: 42, edition: "some edition", start_date: ~D[2025-11-25], end_date: ~D[2025-11-25]}

      assert {:ok, %NationalChampionship{} = national_championship} = Sports.create_national_championship(valid_attrs)
      assert national_championship.active == true
      assert national_championship.name == "some name"
      assert national_championship.year == 42
      assert national_championship.edition == "some edition"
      assert national_championship.start_date == ~D[2025-11-25]
      assert national_championship.end_date == ~D[2025-11-25]
    end

    test "create_national_championship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sports.create_national_championship(@invalid_attrs)
    end

    test "update_national_championship/2 with valid data updates the national_championship" do
      national_championship = national_championship_fixture()
      update_attrs = %{active: false, name: "some updated name", year: 43, edition: "some updated edition", start_date: ~D[2025-11-26], end_date: ~D[2025-11-26]}

      assert {:ok, %NationalChampionship{} = national_championship} = Sports.update_national_championship(national_championship, update_attrs)
      assert national_championship.active == false
      assert national_championship.name == "some updated name"
      assert national_championship.year == 43
      assert national_championship.edition == "some updated edition"
      assert national_championship.start_date == ~D[2025-11-26]
      assert national_championship.end_date == ~D[2025-11-26]
    end

    test "update_national_championship/2 with invalid data returns error changeset" do
      national_championship = national_championship_fixture()
      assert {:error, %Ecto.Changeset{}} = Sports.update_national_championship(national_championship, @invalid_attrs)
      assert national_championship == Sports.get_national_championship!(national_championship.id)
    end

    test "delete_national_championship/1 deletes the national_championship" do
      national_championship = national_championship_fixture()
      assert {:ok, %NationalChampionship{}} = Sports.delete_national_championship(national_championship)
      assert_raise Ecto.NoResultsError, fn -> Sports.get_national_championship!(national_championship.id) end
    end

    test "change_national_championship/1 returns a national_championship changeset" do
      national_championship = national_championship_fixture()
      assert %Ecto.Changeset{} = Sports.change_national_championship(national_championship)
    end
  end

  describe "state_championships" do
    alias FutMasterChampionship.Sports.StateChampionship

    import FutMasterChampionship.SportsFixtures

    @invalid_attrs %{active: nil, name: nil, year: nil, edition: nil, start_date: nil, end_date: nil}

    test "list_state_championships/0 returns all state_championships" do
      state_championship = state_championship_fixture()
      assert Sports.list_state_championships() == [state_championship]
    end

    test "get_state_championship!/1 returns the state_championship with given id" do
      state_championship = state_championship_fixture()
      assert Sports.get_state_championship!(state_championship.id) == state_championship
    end

    test "create_state_championship/1 with valid data creates a state_championship" do
      valid_attrs = %{active: true, name: "some name", year: 42, edition: "some edition", start_date: ~D[2025-11-25], end_date: ~D[2025-11-25]}

      assert {:ok, %StateChampionship{} = state_championship} = Sports.create_state_championship(valid_attrs)
      assert state_championship.active == true
      assert state_championship.name == "some name"
      assert state_championship.year == 42
      assert state_championship.edition == "some edition"
      assert state_championship.start_date == ~D[2025-11-25]
      assert state_championship.end_date == ~D[2025-11-25]
    end

    test "create_state_championship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sports.create_state_championship(@invalid_attrs)
    end

    test "update_state_championship/2 with valid data updates the state_championship" do
      state_championship = state_championship_fixture()
      update_attrs = %{active: false, name: "some updated name", year: 43, edition: "some updated edition", start_date: ~D[2025-11-26], end_date: ~D[2025-11-26]}

      assert {:ok, %StateChampionship{} = state_championship} = Sports.update_state_championship(state_championship, update_attrs)
      assert state_championship.active == false
      assert state_championship.name == "some updated name"
      assert state_championship.year == 43
      assert state_championship.edition == "some updated edition"
      assert state_championship.start_date == ~D[2025-11-26]
      assert state_championship.end_date == ~D[2025-11-26]
    end

    test "update_state_championship/2 with invalid data returns error changeset" do
      state_championship = state_championship_fixture()
      assert {:error, %Ecto.Changeset{}} = Sports.update_state_championship(state_championship, @invalid_attrs)
      assert state_championship == Sports.get_state_championship!(state_championship.id)
    end

    test "delete_state_championship/1 deletes the state_championship" do
      state_championship = state_championship_fixture()
      assert {:ok, %StateChampionship{}} = Sports.delete_state_championship(state_championship)
      assert_raise Ecto.NoResultsError, fn -> Sports.get_state_championship!(state_championship.id) end
    end

    test "change_state_championship/1 returns a state_championship changeset" do
      state_championship = state_championship_fixture()
      assert %Ecto.Changeset{} = Sports.change_state_championship(state_championship)
    end
  end
end
