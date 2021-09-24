defmodule ExMonApi.Structs.Trainer do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Repo

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true #so existe no schema nao existe na tabela
    timestamps()
  end

  @required_params [:name, :password]

  def build(params) do
    changeset(params)
    |> apply_action(:create_player)
  end

  def changeset(trainer, params), do: create_changeset(trainer, params)
  def changeset(params), do: create_changeset( %__MODULE__{}, params)

  defp create_changeset(module_or_trainer, params) do
    module_or_trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6, max: 20)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset)
    do
      change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
