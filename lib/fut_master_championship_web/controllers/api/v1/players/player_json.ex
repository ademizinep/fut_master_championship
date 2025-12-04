defmodule FutMasterChampionshipWeb.V1.Players.PlayerJSON do
  alias FutMasterChampionship.Sports.Player

  def index(%{players: players}) do
    %{data: for(player <- players, do: data(player))}
  end

  def show(%{player: player}) do
    %{data: data(player)}
  end

  defp data(%Player{} = player) do
    %{
      id: player.id,
      name: player.name
    }
  end
end
