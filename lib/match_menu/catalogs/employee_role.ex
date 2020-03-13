defmodule MatchMenu.Catalogs.EmployeeRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_roles" do
    field :role_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee_role, attrs) do
    employee_role
    |> cast(attrs, [:role_name])
    |> validate_required([:role_name])
    |> unique_constraint(:role_name)
  end
end
