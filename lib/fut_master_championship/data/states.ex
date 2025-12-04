defmodule FutMasterChampionship.Data.States do
  @states [
    %{name: "Acre", acronym: "AC", region: "Região Norte", country_acronym: "BR", demonym: "Acreano"},
    %{name: "Alagoas", acronym: "AL", region: "Região Nordeste", country_acronym: "BR", demonym: "Alagoano"},
    %{name: "Amapá", acronym: "AP", region: "Região Norte", country_acronym: "BR", demonym: "Amapaense"},
    %{name: "Amazonas", acronym: "AM", region: "Região Norte", country_acronym: "BR", demonym: "Amazonense"},
    %{name: "Bahia", acronym: "BA", region: "Região Nordeste", country_acronym: "BR", demonym: "Baiano"},
    %{name: "Ceará", acronym: "CE", region: "Região Nordeste", country_acronym: "BR", demonym: "Cearaense"},
    %{name: "Distrito Federal", acronym: "DF", region: "Região Centro-Oeste", country_acronym: "BR", demonym: "Distritense"},
    %{name: "Espírito Santo", acronym: "ES", region: "Região Sudeste", country_acronym: "BR", demonym: "Espírito Santoense"},
    %{name: "Goiás", acronym: "GO", region: "Região Centro-Oeste", country_acronym: "BR", demonym: "Goiano"},
    %{name: "Maranhão", acronym: "MA", region: "Região Nordeste", country_acronym: "BR", demonym: "Maranhense"},
    %{name: "Mato Grosso", acronym: "MT", region: "Região Centro-Oeste", country_acronym: "BR", demonym: "Mato Grossoense"},
    %{name: "Mato Grosso do Sul", acronym: "MS", region: "Região Centro-Oeste", country_acronym: "BR", demonym: "Sul-Mato Grossoense"},
    %{name: "Minas Gerais", acronym: "MG", region: "Região Sudeste", country_acronym: "BR", demonym: "Mineiro"},
    %{name: "Pará", acronym: "PA", region: "Região Norte", country_acronym: "BR", demonym: "Parauense"},
    %{name: "Paraíba", acronym: "PB", region: "Região Nordeste", country_acronym: "BR", demonym: "Paraense"},
    %{name: "Paraná", acronym: "PR", region: "Região Sul", country_acronym: "BR", demonym: "Paranense"},
    %{name: "Pernambuco", acronym: "PE", region: "Região Nordeste", country_acronym: "BR", demonym: "Pernambucano"},
    %{name: "Piauí", acronym: "PI", region: "Região Nordeste", country_acronym: "BR", demonym: "Piauiense"},
    %{name: "Rio de Janeiro", acronym: "RJ", region: "Região Sudeste", country_acronym: "BR", demonym: "Carioca"},
    %{name: "Rio Grande do Norte", acronym: "RN", region: "Região Nordeste", country_acronym: "BR", demonym: "Norte-Rio Grandeense"},
    %{name: "Rio Grande do Sul", acronym: "RS", region: "Região Sul", country_acronym: "BR", demonym: "Sul-Rio Grandeense"},
    %{name: "Rondônia", acronym: "RO", region: "Região Norte", country_acronym: "BR", demonym: "Rondoniense"},
    %{name: "Roraima", acronym: "RR", region: "Região Norte", country_acronym: "BR", demonym: "Norte-Roraimense"},
    %{name: "Santa Catarina", acronym: "SC", region: "Região Sul", country_acronym: "BR", demonym: "Catarinense"},
    %{name: "São Paulo", acronym: "SP", region: "Região Sudeste", country_acronym: "BR", demonym: "Paulistano"},
    %{name: "Sergipe", acronym: "SE", region: "Região Nordeste", country_acronym: "BR", demonym: "Sergipano"},
    %{name: "Tocantins", acronym: "TO", region: "Região Norte", country_acronym: "BR", demonym: "Tocantinense"},
  ]

  def all, do: @states

  def acronyms, do: Enum.map(@states, fn state -> state.acronym end)

  def by_acronym(acronym) when is_binary(acronym) do
    Enum.find(@states, fn state -> state.acronym == String.upcase(acronym) end)
  end
end
