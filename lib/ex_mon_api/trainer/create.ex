defmodule ExMonApi.Trainer.Create do
  alias ExMonApi.{Repo}
  alias ExMonApi.Structs.{Trainer}
  def call(params) do
    Trainer.build(params)
    |> create_trainer()
  end

  defp create_trainer({:ok, struct}), do: Repo.insert(struct)
  defp create_trainer({:error, _changeset} = error),  do: error
end
