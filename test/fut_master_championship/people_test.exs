defmodule FutMasterChampionship.PeopleTest do
  use FutMasterChampionship.DataCase

  alias FutMasterChampionship.People

  describe "people" do
    alias FutMasterChampionship.People.Person

    import FutMasterChampionship.PeopleFixtures

    @invalid_attrs %{name: nil, email: nil}

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert People.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert People.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      valid_attrs = %{name: "some name", email: "some email"}

      assert {:ok, %Person{} = person} = People.create_person(valid_attrs)
      assert person.name == "some name"
      assert person.email == "some email"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email"}

      assert {:ok, %Person{} = person} = People.update_person(person, update_attrs)
      assert person.name == "some updated name"
      assert person.email == "some updated email"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_person(person, @invalid_attrs)
      assert person == People.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = People.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> People.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = People.change_person(person)
    end
  end
end
