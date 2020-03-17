defmodule MatchMenu.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset
  alias MatchMenu.Accounts

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
    |> validate_required([:restaurant_id, :name])
    |> check_if_restaurant
  end

  defp check_if_restaurant(%{valid?: true,
    changes: %{restaurant_id: restaurant_id}} = changeset) do
    case Accounts.get_restaurant(restaurant_id) do
      nil ->
        add_error(changeset, :restaurant_id, "That restaurant doesn't exist")
      _ ->
        changeset
    end
  end

end
