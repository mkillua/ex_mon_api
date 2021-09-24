defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    ExMonApi.create_trainer(params)
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonApi.delete_trainer()
    |> handle_delete_response(conn)
  end


  def show(conn, %{"id" => id}) do
    id
    |> ExMonApi.get_trainer()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExMonApi.update_trainer()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete_response({:ok, _trainer}, conn) do
    put_status(conn, :no_content)
    |> text("")
  end

  defp handle_delete_response({:error, _reason} = seila, _conn), do: seila


  def handle_response({:ok, trainer}, conn, view, status) do
    put_status(conn, status)
    |> render(view, trainer: trainer)
  end

  def handle_response({:error, _changeset} = error, _conn,  _view, _status), do: error
end
