defmodule GameBackend.Entities.Player.Player do
  alias GameBackend.Components.PlayerType
  alias GameBackend.Components.Clothes

  def add_player(player_id) do
    spawn_user(player_id)
  end

  defp spawn_user(player_id) do

    Ecspanse.Command.spawn_entities!([
      {
        Ecspanse.Entity,
        id: player_id,
        components: [
          {PlayerType.Name, name: "dssad"},
          {PlayerType.Hp, hp: 100},
          {PlayerType.Level, current_level: 1, pounts: 0},
        ],
        children: spawn_all_for_user_children(),
      }
    ])
  end

  defp spawn_all_for_user_children do
    Ecspanse.Command.spawn_entities!([
      add_clothers_for_start_user_low_level(),
    ])
  end

  defp add_clothers_for_start_user_low_level do
    {
      Ecspanse.Entity,
      components: [
        {Clothes.Boots, name: "boots", type: :legendary, stats: 100},
        {Clothes.Breast, name: "jaket", type: :normal, stats: 100},
      ]
    }
  end

  @spec list_parrent(binary) :: list(Ecspanse.Entity.t()) | {:error, :not_found}
  def list_parrent(player_id) do
    case Ecspanse.Query.fetch_entity(player_id) do
      {:ok, player} -> Ecspanse.Query.list_parents(player)
      {:error, :not_found} ->  {:error, :not_found}
    end
  end

  @spec get_user_entity(binary) :: {:error, :not_found} | {:ok, Ecspanse.Entity.t()}
  def get_user_entity(player_id) do
    Ecspanse.Query.fetch_entity(player_id)
  end
end
