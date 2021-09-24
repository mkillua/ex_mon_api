defmodule ExMonApiWeb.TrainersView do
  use ExMonApiWeb, :view


  def render("create.json", %{trainer: trainer}) do

    %{
      message: "trainer created",
      trainer: %{
        id: trainer.id,
        name: trainer.name,
        inserted_at: trainer.inserted_at
      }
    }
  end

  def render("show.json", %{trainer: trainer}) do

    %{
      trainer: %{
        id: trainer.id,
        name: trainer.name,
        inserted_at: trainer.inserted_at
      }
    }
  end

  def render("update.json", %{trainer: trainer}) do

    %{
      message: "trainer updated",
      trainer: %{
        id: trainer.id,
        name: trainer.name,
        inserted_at: trainer.inserted_at,
        updated_at: trainer.updated_at
      }
    }
  end
end
