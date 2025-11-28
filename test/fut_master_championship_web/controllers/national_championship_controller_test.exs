defmodule FutMasterChampionshipWeb.NationalChampionshipControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.SportsFixtures
  alias FutMasterChampionship.Sports.NationalChampionship

  @create_attrs %{
    active: true,
    name: "some name",
    year: 42,
    edition: "some edition",
    start_date: ~D[2025-11-25],
    end_date: ~D[2025-11-25]
  }
  @update_attrs %{
    active: false,
    name: "some updated name",
    year: 43,
    edition: "some updated edition",
    start_date: ~D[2025-11-26],
    end_date: ~D[2025-11-26]
  }
  @invalid_attrs %{active: nil, name: nil, year: nil, edition: nil, start_date: nil, end_date: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all national_championships", %{conn: conn} do
      conn = get(conn, ~p"/api/national_championships")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create national_championship" do
    test "renders national_championship when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/national_championships", national_championship: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/national_championships/#{id}")

      assert %{
               "id" => ^id,
               "active" => true,
               "edition" => "some edition",
               "end_date" => "2025-11-25",
               "name" => "some name",
               "start_date" => "2025-11-25",
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/national_championships", national_championship: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update national_championship" do
    setup [:create_national_championship]

    test "renders national_championship when data is valid", %{conn: conn, national_championship: %NationalChampionship{id: id} = national_championship} do
      conn = put(conn, ~p"/api/national_championships/#{national_championship}", national_championship: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/national_championships/#{id}")

      assert %{
               "id" => ^id,
               "active" => false,
               "edition" => "some updated edition",
               "end_date" => "2025-11-26",
               "name" => "some updated name",
               "start_date" => "2025-11-26",
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, national_championship: national_championship} do
      conn = put(conn, ~p"/api/national_championships/#{national_championship}", national_championship: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete national_championship" do
    setup [:create_national_championship]

    test "deletes chosen national_championship", %{conn: conn, national_championship: national_championship} do
      conn = delete(conn, ~p"/api/national_championships/#{national_championship}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/national_championships/#{national_championship}")
      end
    end
  end

  defp create_national_championship(_) do
    national_championship = national_championship_fixture()

    %{national_championship: national_championship}
  end
end
