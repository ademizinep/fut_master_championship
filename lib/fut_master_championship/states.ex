defmodule FutMasterChampionship.States do
  import Ecto.Query, warn: false
  alias FutMasterChampionship.Repo

  alias FutMasterChampionship.States.State

  def list_states do
    Repo.all(State)
  end

  def get_state!(id), do: Repo.get!(State, id)
end
