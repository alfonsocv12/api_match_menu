defmodule MatchMenu.Catalogs.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias MatchMenu.Accounts
  require Logger

  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :restaurant_id, :integer
    field :soft_delete, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    Logger.debug("entro")
    product
    |> cast(attrs, [:name, :description, :price, :restaurant_id])
    |> validate_required([:name, :description, :price, :restaurant_id])
    |> check_if_restaurant_exists
  end

  defp check_if_restaurant_exists(%{valid?: true,
    changes: %{restaurant_id: restaurant_id}} = changeset) do
    Logger.debug("entro")
    case Accounts.get_restaurant(restaurant_id) do
      nil ->
        add_error(changeset, :restaurant_id, "That restaurant doesn't exist")
      _ ->
        changeset
    end
  end
end
