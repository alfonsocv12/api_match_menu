defmodule MatchMenu.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "productos" do
    field :name, :string
    field :price, :float
    field :restaurant_id, :integer

    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:name, :price, :restaurant_id])
    |> validate_required([:name, :price, :restaurant_id])
  end
end
