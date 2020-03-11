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
    field :roll_id, :integer
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
        :password_confirmation, :restaurante_id, :roll_id]
      )
    |> validate_required([
        :employee_alias, :name, :password,
        :password_confirmation,:restaurante_id, :roll_id]
      )
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:employee_alias)
    |> check_if_restaurant_exist
    |> check_if_roll_exist
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

  defp check_if_restaurant_exist(%{valid?: true,
      changes: %{restaurant_id: restaurant_id}} = changeset) do
    case Accounts.get_restaurant() do
      nil ->
        add_error(changeset, :restaurant_id, "That restaurant doesn't exist")
      restaurant ->
        changeset
    end
  end

  defp check_if_roll_exist(%{valid?: true,
    changes: %{roll_id: roll_id}} = changeset) do
    case Catalogs.get_employee_roll(roll_id) do
      nil ->
        add_error(changeset, :roll_id, "That roll doesn't exist")
      employee_roll ->
        changeset
    end
  end

end
