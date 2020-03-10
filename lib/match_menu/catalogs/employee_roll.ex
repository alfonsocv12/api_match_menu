defmodule MatchMenu.Catalogs.EmployeeRoll do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_roll" do
    field :roll_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee_roll, attrs) do
    employee_roll
    |> cast(attrs, [:roll_name])
    |> validate_required([:roll_name])
  end
end
