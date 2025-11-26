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
alias FutMasterChampionship.Teams.Team
alias FutMasterChampionship.Countries.Country
alias FutMasterChampionship.States.State

for i <- 1..200 do
  Repo.insert!(%Team{name: "#{Faker.Company.name()} - #{i}"})
end

for i <- 1..10 do
    Repo.insert!(%Person{name: Faker.Person.name(), email: Faker.Internet.safe_email(), team_id: i})
end

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

for { name, acronym } <- states do
  Repo.insert!(%State{name: name, acronym: acronym, country_id: 1})
end
