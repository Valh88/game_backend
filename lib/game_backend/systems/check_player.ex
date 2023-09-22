defmodule GameBackend.Systems.CheckPlayer do

  use Ecspanse.System

  @impl true
  def run(_frame) do
    {:ok, game_state} = Ecspanse.Query.fetch_resource(Ecspanse.Resource.State)
    Ecspanse.Command.update_resource!(game_state, value: :play)
  end
end
