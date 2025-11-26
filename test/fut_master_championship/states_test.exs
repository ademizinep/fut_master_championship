defmodule FutMasterChampionship.StatesTest do
  use FutMasterChampionship.DataCase

  alias FutMasterChampionship.States

  describe "states" do
    alias FutMasterChampionship.States.State

    import FutMasterChampionship.StatesFixtures

    @invalid_attrs %{name: nil, acronym: nil}

    test "list_states/0 returns all states" do
      state = state_fixture()
      assert States.list_states() == [state]
    end

    test "get_state!/1 returns the state with given id" do
      state = state_fixture()
      assert States.get_state!(state.id) == state
    end

    test "create_state/1 with valid data creates a state" do
      valid_attrs = %{name: "some name", acronym: "some acronym"}

      assert {:ok, %State{} = state} = States.create_state(valid_attrs)
      assert state.name == "some name"
      assert state.acronym == "some acronym"
    end

    test "create_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = States.create_state(@invalid_attrs)
    end

    test "update_state/2 with valid data updates the state" do
      state = state_fixture()
      update_attrs = %{name: "some updated name", acronym: "some updated acronym"}

      assert {:ok, %State{} = state} = States.update_state(state, update_attrs)
      assert state.name == "some updated name"
      assert state.acronym == "some updated acronym"
    end

    test "update_state/2 with invalid data returns error changeset" do
      state = state_fixture()
      assert {:error, %Ecto.Changeset{}} = States.update_state(state, @invalid_attrs)
      assert state == States.get_state!(state.id)
    end

    test "delete_state/1 deletes the state" do
      state = state_fixture()
      assert {:ok, %State{}} = States.delete_state(state)
      assert_raise Ecto.NoResultsError, fn -> States.get_state!(state.id) end
    end

    test "change_state/1 returns a state changeset" do
      state = state_fixture()
      assert %Ecto.Changeset{} = States.change_state(state)
    end
  end
end
