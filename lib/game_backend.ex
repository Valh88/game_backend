defmodule GameBackend do
  @moduledoc """
  Documentation for `GameBackend`.
  """
  use Ecspanse
  alias GameBackend.Systems

  @impl Ecspanse
  def setup(arg) do
    arg
    |> Ecspanse.add_startup_system(Systems.RunWorld)
    |> Ecspanse.add_startup_system(Systems.CheckPlayer)
    |> Ecspanse.add_frame_start_system(Systems.SpawnPlayer)
  end
end
