defmodule FutMasterChampionshipWeb.CountryControllerTest do
  use FutMasterChampionshipWeb.ConnCase

  import FutMasterChampionship.CountriesFixtures
  alias FutMasterChampionship.Countries.Country

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
    test "lists all countries", %{conn: conn} do
      conn = get(conn, ~p"/api/countries")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create country" do
    test "renders country when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/countries", country: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/countries/#{id}")

      assert %{
               "id" => ^id,
               "acronym" => "some acronym",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/countries", country: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update country" do
    setup [:create_country]

    test "renders country when data is valid", %{conn: conn, country: %Country{id: id} = country} do
      conn = put(conn, ~p"/api/countries/#{country}", country: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/countries/#{id}")

      assert %{
               "id" => ^id,
               "acronym" => "some updated acronym",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, country: country} do
      conn = put(conn, ~p"/api/countries/#{country}", country: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete country" do
    setup [:create_country]

    test "deletes chosen country", %{conn: conn, country: country} do
      conn = delete(conn, ~p"/api/countries/#{country}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/countries/#{country}")
      end
    end
  end

  defp create_country(_) do
    country = country_fixture()

    %{country: country}
  end
end
