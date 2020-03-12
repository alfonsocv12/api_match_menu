defmodule MatchMenu.Catalogs.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias MatchMenu.Accounts
  alias MatchMenu.Catalogs

  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :product_type_id, :integer
    field :restaurant_id, :integer
    field :soft_delete, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :product_type_id, :restaurant_id])
    |> validate_required([:name, :description, :price, :product_type_id, :restaurant_id])
    |> check_if_exists
  end

  defp check_if_exists(%{valid?: true,
    changes: %{restaurant_id: restaurant_id}} = changeset) do
    case Accounts.get_restaurant(restaurant_id) do
      nil ->
        add_error(changeset, :restaurant_id, "That restaurant doesn't exist")
      _ ->
        check_if_product_type_exist(changeset)
    end
  end

  defp check_if_product_type_exist(%{valid?: true,
    changes: %{product_type_id: product_type_id}} = changeset) do
    case Catalogs.get_product_type(product_type_id) do
      nil -> add_error(changeset,
        :product_type_id, "That product type doesn't exist")
      _ ->
        changeset
    end
  end
end
