defmodule ExMonApi.Pokemon.Show do
  alias ExMonApi.Wrapper.PokemonApi.Client
  def call(name) do
    name
    |> Client.get_pokemon()
  end
end
