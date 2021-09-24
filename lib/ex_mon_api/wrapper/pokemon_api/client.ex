defmodule ExMonApi.Wrapper.PokemonApi.Client do
  use Tesla
  alias  ExMonApi.Structs.Pokemon

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"
  # plug Tesla.Middleware.Headers, [{"authorization", "token xyz"}]
  plug Tesla.Middleware.JSON #enviar e receber informacao em json e transforma json em map

  def call (name) do
     case get_pokemon(name) do
     {:ok, pokemon} -> pokemon
     {:error, msg} -> msg
     end
  end
  def get_pokemon(name) do
    "/pokemon/#{name}"
    |> get()
    |>handle_get()

  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, Pokemon.build(body)}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "pokemon not found"}
  defp handle_get({:error, _reason}), do: :error

end
