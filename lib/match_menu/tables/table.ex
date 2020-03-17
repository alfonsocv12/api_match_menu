defmodule MatchMenu.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tables" do
    field :description, :string
    field :name, :string
    field :restaurant_id, :integer
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(table, attrs) do
    table
    |> cast(attrs, [:restaurant_id, :name, :size, :description])
    |> validate_required([:restaurant_id, :name, :size, :description])
  end
end
