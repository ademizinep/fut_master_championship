# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FutMasterChampionship.Repo.insert!(%FutMasterChampionship.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FutMasterChampionship.Repo
alias FutMasterChampionship.People.Person
alias FutMasterChampionship.Sports.Team
alias FutMasterChampionship.Countries.Country
alias FutMasterChampionship.Countries.State
alias FutMasterChampionship.Data.Teams
alias FutMasterChampionship.Sports.League
alias FutMasterChampionship.Sports.Championship
alias FutMasterChampionship.Sports.Player

countries = [
  { "Brasil", "BR" }
]

for { name, acronym } <- countries do
  Repo.insert!(%Country{name: name, acronym: acronym})
end

states = [
  { "Acre", "AC", "Região Norte" },
  { "Alagoas", "AL", "Região Nordeste" },
  { "Amapá", "AP", "Região Norte" },
  { "Amazonas", "AM", "Região Norte" },
  { "Bahia", "BA", "Região Nordeste" },
  { "Ceará", "CE", "Região Nordeste" },
  { "Distrito Federal", "DF", "Região Centro-Oeste" },
  { "Espírito Santo", "ES", "Região Sudeste" },
  { "Goiás", "GO", "Região Centro-Oeste" },
  { "Maranhão", "MA", "Região Nordeste" },
  { "Mato Grosso", "MT", "Região Centro-Oeste" },
  { "Mato Grosso do Sul", "MS", "Região Centro-Oeste" },
  { "Minas Gerais", "MG", "Região Sudeste" },
  { "Pará", "PA", "Região Norte" },
  { "Paraíba", "PB", "Região Nordeste" },
  { "Paraná", "PR", "Região Sul" },
  { "Pernambuco", "PE", "Região Nordeste" },
  { "Piauí", "PI", "Região Nordeste" },
  { "Rio de Janeiro", "RJ", "Região Sudeste" },
  { "Rio Grande do Norte", "RN", "Região Nordeste" },
  { "Rio Grande do Sul", "RS", "Região Sul" },
  { "Rondônia", "RO", "Região Norte" },
  { "Roraima", "RR", "Região Norte" },
  { "Santa Catarina", "SC", "Região Sul" },
  { "São Paulo", "SP", "Região Sudeste" },
  { "Sergipe", "SE", "Região Nordeste" },
  { "Tocantins", "TO", "Região Norte" }
]

for { name, acronym, region} <- states do
  Repo.insert!(%State{name: name, acronym: acronym, region: region, country_id: 1})
end

acronyms = Enum.map(states, fn { _, acronym, _ } -> acronym end)
for state_acronym <- acronyms do
  teams = Teams.by_state(state_acronym)
  for %{name: name, acronym: acronym} <- teams do
    team = Repo.insert!(%Team{name: name, acronym: acronym, state_id: Repo.get_by!(State, acronym: state_acronym).id, country_id: Repo.get_by!(Country, acronym: "BR").id})
    for i <- 1..30 do
      Repo.insert!(%Player{name: Faker.Person.name(), age: Enum.random(18..40), team_id: team.id})
    end
  end
end

for i <- 1..10 do
  Repo.insert!(%Person{name: Faker.Person.name(), email: Faker.Internet.safe_email(), team_id: i})
end

leagues = [
  { "Liga Nacional de Futebol", "national" },
  { "Liga do Estado de Minas Gerais", "state" }
]

for { name, type } <- leagues do
  case type do
    "state" ->
      Repo.insert!(%League{name: name, type: type, state_id: Repo.get_by!(State, acronym: "MG").id, country_id: Repo.get_by!(Country, acronym: "BR").id})
    "national" ->
      Repo.insert!(%League{name: name, type: type, country_id: Repo.get_by!(Country, acronym: "BR").id})
  end
end

championships = [
  { "Campeonato Brasileiro", "national", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] },
  { "Campeonato Mineiro", "state", "MG", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] },
  { "Copa Sul-Minas", "regional", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] },
  { "Copa Rio-São Paulo", "regional", "BR", 2025, "Edição 2025", ~D[2025-01-01], ~D[2025-12-31] }
]

for { name, type, acronym, year, edition, start_date, end_date } <- championships do
  case type do
    "state" ->
      Repo.insert!(
        %Championship{
          name: name,
          type: type,
          league_id: Repo.get_by!(League, name: "Liga do Estado de Minas Gerais").id,
          year: year,
          edition: edition,
          start_date: start_date,
          end_date: end_date
        }
      )
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
  end
end
