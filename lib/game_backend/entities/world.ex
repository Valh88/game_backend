defmodule GameBackend.Entities.World.City do
  alias GameBackend.Components.World.Locations

  def start(name) do
    {
      Ecspanse.Entity,
      components: [
        Locations.City,
        {Locations.Name, [name: name]},
      ]
    }
  end

  def fetch_city do
    {city} =
    Ecspanse.Query.select({Ecspanse.Entity}, with: [Locations.City])
    |> Ecspanse.Query.one()
    city
    # {:ok, ent} = Ecspanse.Query.fetch_entity(city.id)
    # Ecspanse.Query.fetch_components(ent, {Locations.Name})
  end
end

defmodule GameBackend.Entities.World.Forest do
  alias GameBackend.Components.World.Mobs
  alias GameBackend.Components.World.Locations

  def start(name) do
    {
      Ecspanse.Entity,
      components: [
        Locations.Forest,
        {Locations.Name, [name: name]},
      ],
      children: spawn_mobs_forest(),
    }
  end

  def get_forest_entity do
    {forest} =
      Ecspanse.Query.select({Ecspanse.Entity}, with: [Locations.Forest])
      |> Ecspanse.Query.one()
    forest
  end

  defp spawn_mobs_forest do
    Ecspanse.Command.spawn_entities!([
      add_wolf_for_forest(),
    ])
  end

  defp add_wolf_for_forest do
    {
      Ecspanse.Entity,
      components: [
        {Mobs.WolfMob, name: "Just Wolf Test"},
        {Mobs.Hp, hp: 50},
        {Mobs.Attack, attack: 10},
        {Mobs.Level, level: 1}
      ]
    }
  end

  def list_children do
    get_forest_entity()
    |> Ecspanse.Query.list_children()
  end
end
