defmodule MatchMenuWeb.EmployeeRollView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.EmployeeRollView

  def render("index.json", %{employee_rolls: employee_rolls}) do
    %{data: render_many(employee_rolls, EmployeeRollView, "employee_roll.json")}
  end

  def render("show.json", %{employee_roll: employee_roll}) do
    %{data: render_one(employee_roll, EmployeeRollView, "employee_roll.json")}
  end

  def render("employee_roll.json", %{employee_roll: employee_roll}) do
    %{
      id: employee_roll.id,
      roll_name: employee_roll.roll_name}
  end
end
