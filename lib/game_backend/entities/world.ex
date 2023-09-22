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

  def fetch do
    {city} =
    Ecspanse.Query.select({Ecspanse.Entity}, with: [Locations.City])
    |> Ecspanse.Query.one()
    {:ok, ent} = Ecspanse.Query.fetch_entity(city.id)
    Ecspanse.Query.fetch_components(ent, {Locations.Name})
  end
end

defmodule GameBackend.Entities.World.Forest do
  alias GameBackend.Components.World.Locations

  def start(name) do
    {
      Ecspanse.Entity,
      components: [
        Locations.Forest,
        {Locations.Name, [name: name]},
      ]
    }
  end
end
