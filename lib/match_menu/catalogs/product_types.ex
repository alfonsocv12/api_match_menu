defmodule MatchMenu.Catalogs.ProductType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_types" do
    field :product_type_name, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_type_name])
    |> validate_required([:product_type_name])
  end
end
