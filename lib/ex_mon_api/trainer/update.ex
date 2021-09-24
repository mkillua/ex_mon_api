defmodule ExMonApi.Trainer.Update do
  alias ExMonApi.{Repo}
  alias ExMonApi.Structs.{Trainer}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do
    UUID.cast(id)
    |> get_trainer()
    |> update_trainer(params)
  end

  defp get_trainer({:ok, uuid}) do
    case Repo.get(Trainer, uuid) do
    nil -> {:error, "trainer not found"}
    trainer -> {:ok, trainer}
    end
  end
  defp get_trainer(:error), do: {:error, "Invalid id format"}

  defp update_trainer({:ok, trainer}, params) do
    Trainer.changeset(trainer, params)
    |> Repo.update()

  end
  defp update_trainer({:error, _changeset} = error, _params),  do: error

end
