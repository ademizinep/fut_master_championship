defmodule FutMasterChampionshipWeb.ChampionshipDivisionControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.SportsFixtures
  alias FutMasterChampionship.Sports.ChampionshipDivision

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all championship_divisions", %{conn: conn} do
      conn = get(conn, ~p"/api/championship_divisions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create championship_division" do
    test "renders championship_division when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/championship_divisions", championship_division: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/championship_divisions/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/championship_divisions", championship_division: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update championship_division" do
    setup [:create_championship_division]

    test "renders championship_division when data is valid", %{conn: conn, championship_division: %ChampionshipDivision{id: id} = championship_division} do
      conn = put(conn, ~p"/api/championship_divisions/#{championship_division}", championship_division: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/championship_divisions/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, championship_division: championship_division} do
      conn = put(conn, ~p"/api/championship_divisions/#{championship_division}", championship_division: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete championship_division" do
    setup [:create_championship_division]

    test "deletes chosen championship_division", %{conn: conn, championship_division: championship_division} do
      conn = delete(conn, ~p"/api/championship_divisions/#{championship_division}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/championship_divisions/#{championship_division}")
      end
    end
  end

  defp create_championship_division(_) do
    championship_division = championship_division_fixture()

    %{championship_division: championship_division}
  end
end
