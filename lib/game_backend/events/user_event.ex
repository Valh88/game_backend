defmodule GameBackend.Events.UserEvent.SpawnPlayer do
  use Ecspanse.Event, fields: [:player_id]
end
