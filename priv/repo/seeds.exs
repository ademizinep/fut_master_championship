defmodule SeedHelper do
  import Ecto.Query
  alias FutMasterChampionship.Repo
  alias FutMasterChampionship.Sports.Championship

  def without_regional do
    Championship
    |> where([c], c.type != "regional")
    |> Repo.all()
  end
end


alias FutMasterChampionship.Repo

alias FutMasterChampionship.Sports
alias FutMasterChampionship.Sports.League

alias FutMasterChampionship.People

alias FutMasterChampionship.Locations
alias FutMasterChampionship.Locations.State

alias FutMasterChampionship.Data.Teams, as: TeamsData
alias FutMasterChampionship.Data.States, as: StatesData

#Querys
states = StatesData.all()
states_acronyms = StatesData.acronyms()

# Countries
countries = [
  { "Brasil", "BR" }
]

for { name, acronym } <- countries do
  {:ok, country} = Locations.create_country(%{name: name, acronym: acronym})
end

# States
for %{name: name, acronym: acronym, region: region, demonym: demonym} <- states do
  {:ok, state} = Locations.create_state(%{name: name, acronym: acronym, region: region, demonym: demonym, country_id: 1})
end

# Teams
for state_acronym <- states_acronyms do
  teams = TeamsData.by_state(state_acronym)
  for %{name: name, acronym: acronym} <- teams do
    {:ok, team} = Sports.create_team(
      %{
        name: name,
        acronym: acronym,
        founded_date: ~D[2025-01-01],
        shield_type: "round",
        primary_color: "#000000",
        secondary_color: "#000000",
        tertiary_color: "#000000",
        description: "Description",
        state_id: Repo.get_by!(State, acronym: state_acronym).id,
        country_id: 1
      }
    )
    for i <- 1..30 do
      Sports.create_player(%{name: Faker.Person.name(), age: Enum.random(17..34), team_id: team.id})
    end
  end
end

# People
for i <- 1..10 do
  {:ok, person} = People.create_person(%{name: Faker.Person.name(), email: Faker.Internet.safe_email()})
end

# Leagues
{:ok, league} = Sports.create_league(%{name: "Liga Nacional de Futebol", type: "national", country_id: 1})

for %{ acronym: acronym, demonym: demonym } <- states do
  {:ok, league} = Sports.create_league(%{name: "Liga #{demonym} de Futebol", type: "state", state_id: Repo.get_by!(State, acronym: acronym).id, country_id: 1})
end

# Championships
championships = [
  { "Campeonato Brasileiro", "national", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] },
  { "Copa Sul-Minas", "regional", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] },
  { "Copa Rio-São Paulo", "regional", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] }
]

for { name, type, acronym, year, edition, start_date, end_date } <- championships do
  case type do
    "regional" ->
      {:ok, championship} = Sports.create_championship(%{
        name: name,
        type: type,
        year: year,
        edition: edition,
        start_date: start_date,
        end_date: end_date,
        league_id: Repo.get_by!(League, name: "Liga Nacional de Futebol").id,
      })
    "national" ->
      {:ok, championship} = Sports.create_championship(%{
          name: name,
          type: type,
          year: year,
          edition: edition,
          start_date: start_date,
          end_date: end_date,
          league_id: Repo.get_by!(League, name: "Liga Nacional de Futebol").id,
        }
      )
    _ -> raise "Invalid championship type: #{type}"
  end
end

for %{ acronym: acronym, demonym: demonym } <- states do
  for 1 <- 1..3 do
    {:ok, championship} = Sports.create_championship(%{
        name: "Campeonato #{demonym}",
        type: "state",
        year: 2025,
        edition: "Edição 2025",
        start_date: ~D[2025-01-01],
        end_date: ~D[2025-12-31],
        league_id: Repo.get_by!(League, name: "Liga #{demonym} de Futebol").id,
      }
    )
  end
end

# Championship Divisions
championship_divisions = ["A", "B", "C"]

for division <- championship_divisions do
  for championship <- SeedHelper.without_regional() do
    {:ok, championship_division} = Sports.create_championship_division(%{name: "#{championship.name} - Série #{division}", type: division, championship_id: championship.id})
  end
end
