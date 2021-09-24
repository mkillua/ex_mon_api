defmodule ExMonApiWeb.WelcomeController do
  use ExMonApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Wecome to the ex mon api")
  end
end
