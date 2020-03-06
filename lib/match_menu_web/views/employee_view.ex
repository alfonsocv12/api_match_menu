defmodule MatchMenuWeb.EmployeeView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.EmployeeView

  def render("index.json", %{employees: employees}) do
    %{data: render_many(employees, EmployeeView, "employee.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee.json")}
  end

  def render("employee.json", %{employee: employee}) do
    %{id: employee.id,
      employee_alias: employee.employee_alias,
      name: employee.name,
      password_hash: employee.password_hash,
      restaurante_id: employee.restaurante_id,
      roll_id: employee.roll_id}
  end
end
