defmodule ExMonApiWeb.PokemonsView do
  use ExMonApiWeb, :view

  def render("show.json", %{pokemon: pokemon}) do

    %{
      pokemon: %{
        id: pokemon.id,
        name: pokemon.name,
        types: pokemon.types,
        weight: pokemon.weight
      }
    }
  end

end
