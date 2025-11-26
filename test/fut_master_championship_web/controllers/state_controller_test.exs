defmodule FutMasterChampionshipWeb.StateControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.StatesFixtures
  alias FutMasterChampionship.States.State

  @create_attrs %{
    name: "some name",
    acronym: "some acronym"
  }
  @update_attrs %{
    name: "some updated name",
    acronym: "some updated acronym"
  }
  @invalid_attrs %{name: nil, acronym: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all states", %{conn: conn} do
      conn = get(conn, ~p"/api/states")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create state" do
    test "renders state when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/states", state: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/states/#{id}")

      assert %{
               "id" => ^id,
               "acronym" => "some acronym",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/states", state: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update state" do
    setup [:create_state]

    test "renders state when data is valid", %{conn: conn, state: %State{id: id} = state} do
      conn = put(conn, ~p"/api/states/#{state}", state: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/states/#{id}")

      assert %{
               "id" => ^id,
               "acronym" => "some updated acronym",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, state: state} do
      conn = put(conn, ~p"/api/states/#{state}", state: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete state" do
    setup [:create_state]

    test "deletes chosen state", %{conn: conn, state: state} do
      conn = delete(conn, ~p"/api/states/#{state}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/states/#{state}")
      end
    end
  end

  defp create_state(_) do
    state = state_fixture()

    %{state: state}
  end
end
