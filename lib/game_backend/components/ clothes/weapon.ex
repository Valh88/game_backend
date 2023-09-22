defmodule GameBackend.Components.Clothes.Weapon do
  use Ecspanse.Component,
  state: [
    :name,
    :type,
    :stats,
  ]
end
