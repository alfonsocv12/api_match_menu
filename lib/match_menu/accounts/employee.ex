defmodule MatchMenu.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :employee_alias, :string
    field :name, :string
    field :password_hash, :string
    field :restaurante_id, :integer
    field :roll_id, :integer

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:employee_alias, :name, :password_hash, :restaurante_id, :roll_id])
    |> validate_required([:employee_alias, :name, :password_hash, :restaurante_id, :roll_id])
    |> unique_constraint(:employee_alias)
  end
end
