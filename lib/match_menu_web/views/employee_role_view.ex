defmodule MatchMenuWeb.EmployeeRoleView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.EmployeeRoleView

  def render("index.json", %{employee_roles: employee_roles}) do
    %{data: render_many(employee_roles, EmployeeRollView, "employee_role.json")}
  end

  def render("show.json", %{employee_role: employee_role}) do
    %{data: render_one(employee_role, EmployeeRoleView, "employee_role.json")}
  end

  def render("employee_role.json", %{employee_role: employee_role}) do
    %{
      id: employee_role.id,
      role_name: employee_role.role_name}
  end
end
