defmodule GameBackend.Components.PlayerType.Real do
  use Ecspanse.Component
end

defmodule GameBackend.Components.PlayerType.Bot do
  use Ecspanse.Component
end

defmodule GameBackend.Components.PlayerType.Player do
  use Ecspanse.Component, state: [:player_id, player: :no_bot]

  @type t :: %__MODULE__{
    player_id: binary()
  }
end

defmodule GameBackend.Components.PlayerType.Name do
  use Ecspanse.Component, state: [:name]

  # def validate(%__MODULE__{name: name}) do
  #   if name do
  #     :ok
  #   else
  #     {:error, "логика проверки в базе"}
  #   end
  # end
end

defmodule GameBackend.Components.PlayerType.Hp do
  use Ecspanse.Component, state: [:hp]

  # def validate(%__MODULE__{hp: hp}) do
  #   if is_integer(hp) do
  #     :ok
  #   else
  #     {:error, "хп должно быть целым числом"}
  #   end
  # end
end

defmodule GameBackend.Components.PlayerType.Level do
  use Ecspanse.Component, state: [current_level: 1, pounts: 0]
end

# defmodule GameBackend.Components.PlayerType.ExperiencePoints do
#   use Ecspanse.Component, state: [points: 0]
# end
