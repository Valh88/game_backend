defmodule GameBackend.Components.World.Mobs.WolfMob do
  use Ecspanse.Component, state: [:name]
end

defmodule GameBackend.Components.World.Mobs.Attack do
  use Ecspanse.Component, state: [:attack]

  def validate(%__MODULE__{attack: state}) do
    if is_integer(state) do
      :ok
    else
      raise("#{state} - должен быть тип integer")
    end
  end
end

defmodule GameBackend.Components.World.Mobs.Hp do
  use Ecspanse.Component, state: [:hp]
end

defmodule GameBackend.Components.World.Mobs.Level do
  use Ecspanse.Component, state: [:level]

  def validate(%__MODULE__{level: level}) do
    if is_integer(level) do
      :ok
    else
      raise("#{level} - должен быть тип integer")
    end
  end
end

