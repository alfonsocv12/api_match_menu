defmodule MatchMenu.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  alias MatchMenu.Catalogs
  alias MatchMenu.Accounts

  schema "employees" do
    field :employee_alias, :string
    field :name, :string
    field :password_hash, :string
    field :restaurant_id, :integer
    field :role_id, :integer
    #virtual fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [
        :employee_alias, :name, :password,
        :password_confirmation, :restaurant_id, :role_id]
      )
    |> validate_required([
        :employee_alias, :name, :password,
        :password_confirmation,:restaurant_id, :role_id]
      )
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:employee_alias)
    |> check_if_relations_exist
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

  defp check_if_relations_exist(%{valid?: true,
      changes: %{restaurant_id: restaurant_id}} = changeset) do
    case Accounts.get_restaurant(restaurant_id) do
      nil ->
        add_error(changeset, :restaurant_id, "That restaurant doesn't exist")
      _ ->
        check_if_role_exist(changeset)
    end
  end

  defp check_if_role_exist(%{valid?: true,
    changes: %{role_id: role_id}} = changeset) do
    case Catalogs.get_employee_role(role_id) do
      nil ->
        add_error(changeset, :role_id, "That role doesn't exist")
      _ ->
        changeset
    end
  end

end
