defmodule GameBackend.Systems.SpawnPlayer do
  alias GameBackend.Entities.World
  alias GameBackend.Entities.Player.Player
  alias GameBackend.Events.UserEvent.SpawnPlayer, as: SpawnPlayerEvent

  use Ecspanse.System,
    #lock_components: [GameBackend.Components.PlayerType.Real],
    event_subscriptions: [SpawnPlayerEvent]

  @impl true
  @spec run(atom | %{:player_id => binary, optional(any) => any}, any) :: :ok
  def run(event, _frame) do
    Player.add_player(event.player_id)

    loc = World.Forest.get_forest_entity()
    {:ok, player} = Player.get_user_entity(event.player_id)
    Ecspanse.Command.add_child!(loc, player)
  end

  @spec spawn_user(binary()) :: :ok
  def spawn_user(player_id) do
    Ecspanse.event(
      {SpawnPlayerEvent, player_id: player_id}
    )
  end

  @spec fetch(binary) :: {:error, :not_found} | {:ok, Ecspanse.Entity.t()}
  def fetch(player_id) do
    Ecspanse.Query.fetch_entity(player_id)
  end
end
