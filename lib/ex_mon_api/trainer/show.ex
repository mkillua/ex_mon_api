defmodule ExMonApi.Trainer.Show do
  alias ExMonApi.{Repo}
  alias ExMonApi.Structs.{Trainer}

  alias Ecto.UUID

  def call(id) do
    UUID.cast(id)
    |> get_trainer()
  end

  defp get_trainer({:ok, uuid}) do
    case Repo.get(Trainer, uuid) do
    nil -> {:error, "trainer not found"}
    trainer -> {:ok, trainer}
    end
  end
  defp get_trainer(:error), do: {:error, "Invalid id format"}



end
