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

for _ <- 1..10 do
  Repo.insert!(%Person{name: Faker.Person.name(), email: Faker.Internet.safe_email()})
end
