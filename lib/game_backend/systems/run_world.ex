defmodule GameBackend.Systems.RunWorld do
  use Ecspanse.System
  alias GameBackend.Entities.World


  def run(_arg) do
    Ecspanse.Command.spawn_entity!(World.Forest.start("name location"))
    Ecspanse.Command.spawn_entity!(World.City.start("Name city"))
  end
end
