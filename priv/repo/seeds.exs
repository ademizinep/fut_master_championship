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
alias FutMasterChampionship.Sports.Team
alias FutMasterChampionship.Sports.League
alias FutMasterChampionship.Sports.Championship
alias FutMasterChampionship.Sports.Player
alias FutMasterChampionship.Sports.ChampionshipDivision

alias FutMasterChampionship.People.Person

alias FutMasterChampionship.Locations.Country
alias FutMasterChampionship.Locations.State

alias FutMasterChampionship.Data.Teams, as: TeamsData
alias FutMasterChampionship.Data.States, as: StatesData

#Querys
states = StatesData.all()
acronyms = StatesData.acronyms()

IO.inspect(states)

# Countries
countries = [
  { "Brasil", "BR" }
]

for { name, acronym } <- countries do
  Repo.insert!(%Country{name: name, acronym: acronym})
end

# States
for %{name: name, acronym: acronym, region: region, demonym: demonym} <- states do
  Repo.insert!(%State{name: name, acronym: acronym, region: region, demonym: demonym, country_id: 1})
end

# Teams
for state_acronym <- acronyms do
  teams = TeamsData.by_state(state_acronym)
  for %{name: name, acronym: acronym} <- teams do
    team = Repo.insert!(%Team{name: name, acronym: acronym, state_id: Repo.get_by!(State, acronym: state_acronym).id, country_id: 1})
    for i <- 1..30 do
      Repo.insert!(%Player{name: Faker.Person.name(), age: Enum.random(17..34), team_id: team.id})
    end
  end
end

# People
for i <- 1..10 do
  Repo.insert!(%Person{name: Faker.Person.name(), email: Faker.Internet.safe_email()})
end

# Leagues
Repo.insert!(%League{name: "Liga Nacional de Futebol", type: "national", country_id: Repo.get_by!(Country, acronym: "BR").id})

for %{ acronym: acronym, demonym: demonym } <- states do
  Repo.insert!(%League{name: "Liga #{demonym} de Futebol", type: "state", state_id: Repo.get_by!(State, acronym: acronym).id, country_id: 1})
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
      Repo.insert!(
        %Championship{
          name: name,
          type: type,
          league_id: Repo.get_by!(League, name: "Liga Nacional de Futebol").id,
          year: year,
          edition: edition,
          start_date: start_date,
          end_date: end_date
        }
      )
    "national" ->
      Repo.insert!(
        %Championship{
          name: name,
          type: type,
          league_id: Repo.get_by!(League, name: "Liga Nacional de Futebol").id,
          year: year,
          edition: edition,
          start_date: start_date,
          end_date: end_date
        }
      )
    _ -> raise "Invalid championship type: #{type}"
  end
end

for %{ acronym: acronym, demonym: demonym } <- states do
  for 1 <- 1..3 do
    Repo.insert!(
      %Championship{
        name: "Campeonato #{demonym}",
        type: "state",
        league_id: Repo.get_by!(League, name: "Liga #{demonym} de Futebol").id,
        year: 2025,
        edition: "Edição 2025",
        start_date: ~D[2025-01-01],
        end_date: ~D[2025-12-31]
      }
    )
  end
end

# Championship Divisions
championship_divisions = ["A", "B", "C"]

for division <- championship_divisions do
  for championship <- SeedHelper.without_regional() do
    Repo.insert!(%ChampionshipDivision{name: "#{championship.name} - Série #{division}", type: division, championship_id: championship.id})
  end
end
