defmodule ExMonApiWeb.PokemonsController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def show(conn, %{"id" => name}) do
    name
    |> ExMonApi.get_pokemon()
    |> handle_response(conn, "show.json", :ok)
  end

  def handle_response({:ok, pokemon}, conn, view, status) do
    put_status(conn, status)
    |> render(view, pokemon: pokemon)
  end

  def handle_response({:error, _changeset} = error, _conn,  _view, _status), do: error
end
