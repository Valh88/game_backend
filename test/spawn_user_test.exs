defmodule GameBackend.Systems.SpawnUserTest do
  use ExUnit.Case, async: false
  alias Credo.CLI.Command.List.ListOutput
  alias Ecspanse.Entity, as: EntityStruct
  import Logger

  defmodule GameTest do
    use Ecspanse

    @impl true
    def setup(arg) do
      arg
      |> Ecspanse.add_startup_system(GameBackend.Systems.RunWorld)
      |> Ecspanse.add_startup_system(GameBackend.Systems.CheckPlayer)
      |> Ecspanse.add_frame_start_system(GameBackend.Systems.SpawnPlayer)
    end
  end

  setup do
    {:ok, _proc} = start_supervised({GameBackend, :test})
    Ecspanse.System.debug()
    # event = 3

    %{fake_id: "dasdsadsadsaddasd"}
  end

  test "check system, spawn user",
  %{fake_id: fake_id_player} do
    e = event(fake_id_player)
    frame = frame(e)
    GameBackend.Systems.SpawnPlayer.run(e, frame)
    {:ok, ent} = GameBackend.Systems.SpawnPlayer.fetch(fake_id_player)
    assert ent.id == fake_id_player
    Logger.info(ent)


    {:ok, hp_component} = GameBackend.Components.PlayerType.Hp.fetch(ent)
    assert hp_component.hp == 100


    [parrent] = GameBackend.Entities.Player.Player.list_parrent(fake_id_player)
    IO.inspect(parrent)
    {:ok, component} = Ecspanse.Query.fetch_component(parrent, GameBackend.Components.World.Locations.Name)
    assert component.name == "name location"


    [_, child_2] = GameBackend.Entities.World.Forest.list_children()
    assert child_2.id == fake_id_player
    Logger.info(child_2.id)
  end

  defp frame(event) do
    %Ecspanse.Frame{event_batches: [[event]], delta: 1}
  end

  defp event(player_id) do
    %GameBackend.Events.UserEvent.SpawnPlayer{
      player_id: player_id,
      inserted_at: System.os_time()
    }
  end
end
