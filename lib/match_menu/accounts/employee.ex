defmodule MatchMenu.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :employee_alias, :string
    field :name, :string
    field :password_hash, :string
    field :restaurante_id, :integer
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
        :employee_alias, :name, :password_hash,
        :restaurante_id, :roll_id])
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:employee_alias)
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
