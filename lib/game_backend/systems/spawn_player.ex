defmodule GameBackend.Systems.SpawnPlayer do
  alias GameBackend.Entities.Player.Player
  alias GameBackend.Events.UserEvent.SpawnPlayer, as: SpawnPlayerEvent

  use Ecspanse.System,
    #lock_components: [GameBackend.Components.PlayerType.Real],
    event_subscriptions: [SpawnPlayerEvent]

  @fake_id_user_from_db UUID.uuid4()

  @impl true
  def run(event, _frame) do
    IO.inspect(event)
    Player.add_player(event.player_id)
  end

  def spawn_user do
    Ecspanse.event(
      {SpawnPlayerEvent, player_id: @fake_id_user_from_db}
    )
  end

  def fetch(player_id) do
    Ecspanse.Query.fetch_entity(player_id)
  end
end
