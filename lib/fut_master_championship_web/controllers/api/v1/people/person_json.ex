defmodule FutMasterChampionshipWeb.V1.People.PersonJSON do
  alias FutMasterChampionship.People.Person

  def index(%{people: people}) do
    %{data: for(person <- people, do: data(person))}
  end

  def show(%{person: person}) do
    %{data: data(person)}
  end

  defp data(%Person{} = person) do
    %{
      id: person.id,
      name: person.name,
      email: person.email
    }
  end
end
