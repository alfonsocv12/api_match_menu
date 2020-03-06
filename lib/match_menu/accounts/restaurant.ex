defmodule MatchMenu.Accounts.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :restaurant_alias, :string
    field :logo, :string
    field :name, :string
    field :password_hash, :string
    field :polyline, :string
    #virtual fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [
        :restaurant_alias, :name,
        :polyline, :logo,
        :password, :password_confirmation]
      )
    |> validate_required([
        :restaurant_alias, :name,
        :password, :password_confirmation
        ])
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:restaurant_alias)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))
      _ ->
          changeset
    end
  end
end
