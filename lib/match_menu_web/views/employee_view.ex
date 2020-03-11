defmodule MatchMenuWeb.EmployeeView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.EmployeeView

  def render("index.json", %{employees: employees}) do
    %{data: render_many(employees, EmployeeView, "employees.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee.json")}
  end

  def render("employee.json", %{employee: employee}) do
    %{id: employee.id,
      employee_alias: employee.employee_alias,
      name: employee.name,
      restaurant_id: employee.restaurant_id,
      roll_id: employee.roll_id}
  end

  def render "jwt.json", %{jwt: jwt} do
    %{jwt: jwt}
  end
end
